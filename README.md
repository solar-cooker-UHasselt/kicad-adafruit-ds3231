# kicad-adafruit-ds3231

[![ERC/DRC](https://img.shields.io/github/actions/workflow/status/solar-cooker-UHasselt/kicad-adafruit-ds3231/kibot.yml?branch=main&event=push&label=ERC%2FDRC)](https://github.com/solar-cooker-UHasselt/kicad-adafruit-ds3231/actions/workflows/kibot.yml)
[![KiCad 10](https://img.shields.io/badge/KiCad-10-314CB0)](https://www.kicad.org/download/)
[![Renovate](https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fsolar-cooker-UHasselt%2Fkicad-adafruit-ds3231%2Fissues%2F2&search=currently%20has%20%28no%20open%20or%20pending%29%20branches%7C%23%23%20%28Pending%20Approval%7CAwaiting%20Schedule%7CRate-Limited%7CErrored%7COpen%29&replace=%241%242&label=renovate&logo=renovatebot)](https://github.com/solar-cooker-UHasselt/kicad-adafruit-ds3231/issues/2)

A breakout board for the DS3231, a precision real-time clock with a built-in
temperature-compensated crystal and a CR1220 coin cell that keeps the time without
power. It is a KiCad 10 port of
[Adafruit's DS3231 breakout](https://github.com/adafruit/Adafruit-DS3231-Precision-RTC-Breakout-PCB),
originally drawn in Eagle.

In the [solar cooker](https://github.com/solar-cooker-UHasselt) testing station, the
firmware ([arduino-code](https://github.com/solar-cooker-UHasselt/arduino-code)) reads
the date and time from it over I²C to stamp every measurement and to name the CSV
files on the microSD card.

[![3D render of the board, top side](https://solar-cooker-uhasselt.github.io/kicad-adafruit-ds3231/DS3231-render-top.png)](https://solar-cooker-uhasselt.github.io/kicad-adafruit-ds3231/)

- [Board page](https://solar-cooker-uhasselt.github.io/kicad-adafruit-ds3231/): 3D
  renders, drawings, schematic and board PDF, interactive BOM and the BOM CSV for
  Eurocircuits, rebuilt by CI on every push to `main`
- [PCB source](https://github.com/adafruit/Adafruit-DS3231-Precision-RTC-Breakout-PCB):
  Adafruit's Eagle files
- [Adafruit guide](https://learn.adafruit.com/adafruit-ds3231-precision-rtc-breakout):
  pinout, wiring and Arduino examples

## Installation

### Requirements

- [KiCad 10](https://www.kicad.org/download/), to open and edit the board
- [git](https://git-scm.com), to clone the repo with its library
- Optional, for the checks: [just](https://just.systems), and for `just ci`
  [act](https://github.com/nektos/act) with Docker

### Clone

Own symbols, footprints and 3D models come from
[kicad-common](https://github.com/solar-cooker-UHasselt/kicad-common), a git submodule
at `kicad-common/`. Clone with it:

```bash
git clone --recurse-submodules https://github.com/solar-cooker-UHasselt/kicad-adafruit-ds3231.git
```

Or, in a clone made without it:

```bash
just setup
```

## Usage

Open `DS3231.kicad_pro` in KiCad 10. The schematic and board open from there.

ERC and DRC, reports in `tmp/`:

```bash
just check
```

DRC also checks the board maker's limits: `DS3231.kicad_dru` holds the Eurocircuits
PCB proto rules (class 6C), a copy of the file in `kicad-common/design-rules/`. After
updating `kicad-common`, refresh the copy (`just check` fails until then):

```bash
just rules
```

Schematic and board PDF in `outputs/` (CI also makes them, as the `outputs` artifact):

```bash
just pdf
```

The same, then open both in the default PDF viewer (Linux and macOS):

```bash
just open
```

The KiBot CI workflow, locally:

```bash
just ci
```

All recipes:

```bash
just --list
```

## Contributing

- Every push and pull request runs ERC and DRC in CI, through the shared workflows in
  [kicad-ci](https://github.com/solar-cooker-UHasselt/kicad-ci). A push to `main` also
  rebuilds the board page.
- Commits follow Conventional Commits, with one change per commit. Types, scopes and the
  ERC/DRC check are in
  [.agents/commit_conventions.md](.agents/commit_conventions.md).
- This is the reference repo for the other board repos: a change to the board setup,
  CI or docs is made and tested here first.

## Authors and acknowledgment

The board is Adafruit's design, by Limor Fried/Ladyada for Adafruit Industries
([PCB source](https://github.com/adafruit/Adafruit-DS3231-Precision-RTC-Breakout-PCB)).
The KiCad 10 port is by Lowie Van Vyve for the UHasselt solar cooker project.

Adafruit invests time and resources providing this open source design. Please support
Adafruit and open-source hardware by purchasing products from
[Adafruit](https://www.adafruit.com).

<details>
<summary>Adafruit's original README, included as its license asks</summary>

> **Adafruit DS3231 Precision RTC Breakout PCB**
>
> [Click here to purchase one from the Adafruit shop](http://www.adafruit.com/products/5188)
>
> [Click here to purchase one from the Adafruit shop](http://www.adafruit.com/products/3013)
>
> The datasheet for the DS3231 explains that this part is an "Extremely Accurate
> I²C-Integrated RTC/TCXO/Crystal". And, hey, it does exactly what it says on the tin!
> This Real Time Clock (RTC) is the most precise you can get in a small, low power
> package.
>
> Most RTCs use an external 32kHz timing crystal that is used to keep time with low
> current draw. And that's all well and good, but those crystals have slight drift,
> particularly when the temperature changes (the temperature changes the oscillation
> frequency very very very slightly but it does add up!) This RTC is in a beefy package
> because the crystal is inside the chip! And right next to the integrated crystal is a
> temperature sensor. That sensor compensates for the frequency changes by adding or
> removing clock ticks so that the timekeeping stays on schedule.
>
> This is the finest RTC you can get, and now we have it in a compact,
> breadboard-friendly breakout. With a coin cell plugged into the back, you can get
> years of precision timekeeping, even when main power is lost. Great for datalogging
> and clocks, or anything where you need to really know the time.
>
> PCB files for the Adafruit DS3231 Precision RTC Breakout. The format is EagleCAD
> schematic and board layout
>
> - https://www.adafruit.com/products/3013
>
> **License**
>
> Adafruit invests time and resources providing this open source design, please support
> Adafruit and open-source hardware by purchasing products from
> [Adafruit](https://www.adafruit.com)!
>
> All text above must be included in any redistribution
>
> Designed by Limor Fried/Ladyada for Adafruit Industries. Creative Commons
> Attribution/Share-Alike, all text above must be included in any redistribution. See
> license.txt for additional information.

</details>

## License

[CC BY-SA 4.0](LICENSE). Adafruit's original design is licensed CC BY-SA 3.0, which
allows adaptations like this port under a later version with the same terms.
