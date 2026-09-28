# Documentation conventions

This repo's documentation rules. The shared conventions are the `check-docs` skill,
which reads this file first and follows it where the two differ.

## Doc map

Each document and the one type it is:

| File                                   | Type      |
| -------------------------------------- | --------- |
| `README.md`                            | how-to    |
| `AGENTS.md`                            | reference |
| `.agents/commit_conventions.md`        | reference |
| `.agents/documentation_conventions.md` | reference |

`kicad-common/` is a submodule with its own docs, not checked here.

## Where things go

- **`docs/`**: none yet.
- **`.agents/`**: `commit_conventions.md` (types, scopes, the ERC/DRC check per
  commit), `documentation_conventions.md` (this file).

## Exceptions

- **KiCad project name.** The project and its files are named after the board's main
  part, written as the part is printed: `DS3231.kicad_pro`, `.kicad_sch`, `.kicad_pcb`.
  KiCad names every output after the project (the PDFs, the renders on the board page),
  so a rename would change the board page's file URLs.
- **KiCad's own names.** `sym-lib-table` and `fp-lib-table` are the names KiCad looks
  for.

## Check

Every relative link in the repo's own Markdown resolves: the fallback link check in the
`check-docs` skill.
