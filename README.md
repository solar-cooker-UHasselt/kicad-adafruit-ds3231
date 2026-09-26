# kicad-adafruit-ds3231

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

All recipes:

```bash
just --list
```
