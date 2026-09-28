# kicad-adafruit-ds3231

[![ERC/DRC](https://img.shields.io/github/actions/workflow/status/solar-cooker-UHasselt/kicad-adafruit-ds3231/kibot.yml?branch=main&event=push&label=ERC%2FDRC)](https://github.com/solar-cooker-UHasselt/kicad-adafruit-ds3231/actions/workflows/kibot.yml)
![KiCad 10](https://img.shields.io/badge/KiCad-10-314CB0)
[![Renovate](https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fsolar-cooker-UHasselt%2Fkicad-adafruit-ds3231%2Fissues%2F2&search=currently%20has%20%28no%20open%20or%20pending%29%20branches%7C%23%23%20%28Pending%20Approval%7CAwaiting%20Schedule%7CRate-Limited%7CErrored%7COpen%29&replace=%241%242&label=renovate&logo=renovatebot)](https://github.com/solar-cooker-UHasselt/kicad-adafruit-ds3231/issues/2)

- [Board page](https://solar-cooker-uhasselt.github.io/kicad-adafruit-ds3231/): 3D
  renders, drawings, schematic and board PDF, rebuilt by CI on every push to `main`
- [PCB source](https://github.com/adafruit/Adafruit-DS3231-Precision-RTC-Breakout-PCB)
- [Wiki](https://learn.adafruit.com/adafruit-ds3231-precision-rtc-breakout)

## Libraries

Own symbols and footprints come from
[kicad-common](https://github.com/solar-cooker-UHasselt/kicad-common), a git submodule
at `kicad-common/`. Clone with it:

```bash
git clone --recurse-submodules https://github.com/solar-cooker-UHasselt/kicad-adafruit-ds3231.git
```

Or, in a clone made without it:

```bash
just setup
```

## Checks

Needs [KiCad 10](https://www.kicad.org/download/) and [just](https://just.systems).

ERC and DRC, reports in `tmp/`:

```bash
just check
```

KiBot CI workflow, locally (needs [act](https://github.com/nektos/act) and Docker):

```bash
just ci
```

Schematic and board PDF in `outputs/` (CI also makes them, as the `outputs` artifact):

```bash
just pdf
```

All recipes:

```bash
just --list
```
