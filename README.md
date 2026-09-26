# kicad-adafruit-ds3231

[![ERC/DRC](https://img.shields.io/github/actions/workflow/status/solar-cooker-UHasselt/kicad-adafruit-ds3231/kibot.yml?branch=main&event=push&label=ERC%2FDRC)](https://github.com/solar-cooker-UHasselt/kicad-adafruit-ds3231/actions/workflows/kibot.yml)
![KiCad 10](https://img.shields.io/badge/KiCad-10-314CB0)

- [PCB source](https://github.com/adafruit/Adafruit-DS3231-Precision-RTC-Breakout-PCB)
- [Wiki](https://learn.adafruit.com/adafruit-ds3231-precision-rtc-breakout)

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
