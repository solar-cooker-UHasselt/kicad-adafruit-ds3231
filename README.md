# solar-cooker-kicad-adafruit-ds3231

- [source repository](https://github.com/adafruit/Adafruit-DS3231-Precision-RTC-Breakout-PCB)

The Adafruit PCB files are made with [Autodesk Eagle](https://www.autodesk.com/products/eagle/free-download). In this repository [KiCad](https://www.kicad.org/download/) is used.

## How to migrate from Eagle to KiCad

Before you start, make sure you download the source repository and place it somewhere on your PC.

First, create a new KiCad project. After the project is created, open the schematic editor. Navigate to `File`> `Import` > `Non-KiCad Schematic`. Navigate to your downloaded repository and select the `Adafruit DS3231 RTC Breakout.sch` file.

Now switch to the PCB editor to import the board file. Navigate to `File`> `Import` > `Non-KiCad Board File`. Open the `Adafruit DS3231 RTC Breakout.brd` file. Click on `Auto-Match Layers` and `OK`. It's possible that some layers will not map, don't worry.

For some reason, the board file is not saved in the project directory, but in the `.brd` file directory. To fix this, navigate to the source directory and copy the `.kicad_pcb` file to your project directory and rename it to the `.kicad_pcb` file already present in your project.

## Switching to native KiCad symbols

When importing from other EDA software, KiCad will create an import library with all the symbols. Try to migrate all symbols to a default KiCad library.

> [!TIP]
> Replacing a resistor is as follows. Double click on the resistor and select `Change Symbol`. Take note of the [package size](https://en.wikipedia.org/wiki/List_of_integrated_circuit_packaging_types#Two-terminal_packages) to select the right footprint afterwards. Now click on `New library identifier` and find the resistor. Resistors in KiCad are name `R` or `R_small` (preffered). Click on `Change` to change the symbol, rewire if necessary.

## Convenient external providers of footprints and symbols.

If you can't find a footprint or 3D model in KiCad, you can always try to find it online. Here are some useful sites:

- [Component Search Engine](https://componentsearchengine.com/)
- [SnapEDA (preferred)](https://www.snapeda.com/)
- [Ultra Librarian](https://www.ultralibrarian.com/)

> [!IMPORTANT]  
> When looking for a component make sure it is avaible at one of the following providers.
> - [DigiKey](https://www.digikey.com/)
> - [Mouser](https://eu.mouser.com/)
> - [Eurocircuits `⚠`](https://www.eurocircuits.com/)

Eurocircuits is our chosen manufacturer of PCBs, headquartered in Belgium. You can upload a BOM file to check if the components can be supplied or not.
