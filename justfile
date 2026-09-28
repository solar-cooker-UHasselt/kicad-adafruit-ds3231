set shell := ["bash", "-euo", "pipefail", "-c"]

board := "DS3231"
rules := "eurocircuits-proto-6c"
rules_src := "kicad-common/design-rules/" + rules + ".kicad_dru"
opener := if os() == "macos" { "open" } else { "xdg-open" }

# List the recipes
default:
    @just --list

# Fetch the kicad-common library submodule
setup:
    git submodule update --init

# Run ERC on the schematic, full report in tmp/erc.rpt
erc:
    kicad-cli sch erc --severity-all -o tmp/erc.rpt {{ board }}.kicad_sch

# Run DRC with schematic parity, full report in tmp/drc.rpt
drc:
    kicad-cli pcb drc --severity-all --schematic-parity -o tmp/drc.rpt {{ board }}.kicad_pcb

# Copy the design rules from kicad-common to <board>.kicad_dru
rules:
    cp {{ rules_src }} {{ board }}.kicad_dru

# Check that <board>.kicad_dru matches its source in kicad-common
[no-exit-message]
rules-check:
    @cmp -s {{ rules_src }} {{ board }}.kicad_dru || { echo "{{ board }}.kicad_dru is out of date, run: just rules" >&2; exit 1; }

# Run the KiBot CI workflow locally with act
ci:
    act push -W .github/workflows/kibot.yml

# Check the design rules, then run ERC and DRC
check: rules-check erc drc

# Export the schematic to outputs/<board>-schematic.pdf
sch-pdf:
    kicad-cli sch export pdf -o outputs/{{ board }}-schematic.pdf {{ board }}.kicad_sch

# Export copper and silkscreen layers to outputs/<board>-board.pdf, one page per layer
pcb-pdf:
    kicad-cli pcb export pdf --mode-multipage --include-border-title --layers F.Cu,B.Cu,F.Silkscreen,B.Silkscreen --common-layers Edge.Cuts -o outputs/{{ board }}-board.pdf {{ board }}.kicad_pcb

# Export both PDFs
pdf: sch-pdf pcb-pdf

# Export both PDFs and open them
open: pdf
    {{ opener }} outputs/{{ board }}-schematic.pdf
    {{ opener }} outputs/{{ board }}-board.pdf
