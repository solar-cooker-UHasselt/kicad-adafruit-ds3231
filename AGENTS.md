# AGENTS.md

Guidance for AI coding agents working in this repository. `CLAUDE.md` is a symlink to
this file.

Make sure to also read [`README.md`](README.md) for the human-facing docs.

## Project overview

KiCad 10 port of the Adafruit DS3231 precision real-time clock breakout, part of the
UHasselt solar cooker testing station. There is no code: the repo is a KiCad project,
checked by KiBot in CI through the shared workflows in
[kicad-ci](https://github.com/solar-cooker-UHasselt/kicad-ci).

This is the reference repo for the other board repos (bme680, max31865, microsd,
testing-station): every change to the board setup, CI or docs is made and tested here
first, then copied. The step list is kept outside the repo, in the workspace's
`tmp/kicad10-migration.md`.

## Repository map

```
DS3231.kicad_pro          # project: board setup, pinned libraries, revision
DS3231.kicad_sch          # schematic
DS3231.kicad_pcb          # board layout
DS3231.kicad_dru          # custom DRC rules, a copy from kicad-common (just rules)
drawing_sheet.kicad_wks   # title block and logos, this repo's own copy
sym-lib-table             # symbol library: solar_cooker from kicad-common
fp-lib-table              # footprint library: solar_cooker from kicad-common
kicad-common/             # git submodule, own symbols, footprints and 3D models
justfile                  # ERC, DRC, PDFs, local CI
.github/workflows/        # thin wrappers calling kicad-ci at @v1
renovate.json             # extends the org's shared Renovate settings
.agents/                  # commit and documentation conventions
```

## Where things live

| To change…                                   | Edit                                                                |
| -------------------------------------------- | ------------------------------------------------------------------- |
| The circuit                                  | `DS3231.kicad_sch` in KiCad, then F8 to the board                   |
| Placement, routing, zones                    | `DS3231.kicad_pcb` in KiCad                                         |
| An own symbol, footprint or 3D model         | the `kicad-common` repo, then update the submodule here             |
| The DRC rules (board maker limits)           | `kicad-common/design-rules/`, then update the submodule and `just rules` |
| ERC/DRC in CI, the board page, KiBot outputs | the `kicad-ci` repo, then move its `v1` tag                         |
| Which kicad-ci workflows run, and when       | `.github/workflows/`                                                |
| Dependency updates                           | `renovate.json`, or the shared settings in the org's `.github` repo |

The maintainer edits the schematic and board in KiCad. Agents read the files, run the
checks, and change text files (`sym-lib-table`, `.kicad_pro` fields, workflows, docs).

## Setup

```bash
git submodule update --init   # or: just setup
```

Needs KiCad 10 (`kicad-cli`) and just. `just ci` also needs act and Docker.

## Checks

```bash
just check   # rules copy current, ERC and DRC with schematic parity, reports in tmp/
just ci      # the KiBot workflow locally with act, for workflow changes
```

Done when: ERC 0 errors, DRC 0 errors, 0 parity issues. Compare the counts with the
previous commit. `just ci` caches kicad-ci's `v1`: after the tag moves, clear it with
`rm -rf ~/.cache/act/solar-cooker-UHasselt-kicad-ci*`.

Before finishing, re-read the diff and check it follows existing patterns, is minimal
(nothing unrelated touched), and passes `just check`. (Our convention.)

## Tools

- **KiBot, through kicad-ci.** No `config.kibot.yml` here: kicad-ci's default config
  applies. The KiBot image is pinned in kicad-ci, not here.
- **kicad-happy.** Use its `kicad` skill for a design review of the schematic and
  board. House rules it does not know are in this file and `.agents/`.
- **Renovate.** Dashboard in issue #2, PRs open on weekends. `main` restricts pushes, so
  a Renovate PR merges with `gh pr merge … --admin`.

## Security

- No secrets: CI uses only the `GITHUB_TOKEN`, with `pages: write` and `id-token: write`
  for the board page.
- Never commit `*.kicad_prl`, lock files (`~*`), `tmp/` or generated outputs.
  `.gitignore` covers them.

## Commit & PR guidelines

**Never commit. Propose the message only**, and the maintainer reviews and commits
manually. Do not run `git commit` / `git push` / `git add` unless explicitly told to.
(Our convention.)

Use the `propose-commit` skill: Conventional Commits, one concern per commit, the
message handed over in `tmp/`. This repo's types, scopes and check:
[.agents/commit_conventions.md](.agents/commit_conventions.md). **Never use em dashes or
semicolons** in commit messages or any written output. (Our convention.)

## Documentation

Use the `check-docs` skill when writing or reshaping a README, a guide in `docs/` or an
agent file: one Diátaxis type per file, the README shape, naming. This repo's doc map,
exceptions and link check:
[.agents/documentation_conventions.md](.agents/documentation_conventions.md).
(Our convention.)

## Deployment

- The board page (renders, drawings, schematic and board PDF) is published to GitHub
  Pages by the `pages` job in `.github/workflows/kibot.yml`, from `main` only: every push
  that changes more than Markdown, and manual runs. Pull requests never publish.
  <https://solar-cooker-uhasselt.github.io/kicad-adafruit-ds3231/>

## References

- agents.md spec: <https://agents.md/>
- KiCad file formats: <https://dev-docs.kicad.org/en/file-formats/>
- Adafruit's original design (Eagle): <https://github.com/adafruit/Adafruit-DS3231-Precision-RTC-Breakout-PCB>
