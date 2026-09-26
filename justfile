set shell := ["bash", "-euo", "pipefail", "-c"]

board := "DS3231"

# List the recipes
default:
    @just --list

# Run ERC on the schematic, full report in tmp/erc.rpt
erc:
    kicad-cli sch erc --severity-all -o tmp/erc.rpt {{ board }}.kicad_sch

# Run DRC with schematic parity, full report in tmp/drc.rpt
drc:
    kicad-cli pcb drc --severity-all --schematic-parity -o tmp/drc.rpt {{ board }}.kicad_pcb

# Run the KiBot CI workflow locally with act
ci:
    act push -W .github/workflows/kibot.yml

# Run ERC and DRC
check: erc drc

# Export the schematic to outputs/<board>-schematic.pdf
sch-pdf:
    kicad-cli sch export pdf -o outputs/{{ board }}-schematic.pdf {{ board }}.kicad_sch

# Export copper and silkscreen layers to outputs/<board>-board.pdf, one page per layer
pcb-pdf:
    kicad-cli pcb export pdf --mode-multipage --include-border-title --layers F.Cu,B.Cu,F.Silkscreen,B.Silkscreen --common-layers Edge.Cuts -o outputs/{{ board }}-board.pdf {{ board }}.kicad_pcb

# Export both PDFs
pdf: sch-pdf pcb-pdf
