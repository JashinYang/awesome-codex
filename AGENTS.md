# AGENTS.md

Instructions for coding agents (Codex, Claude Code, etc.) working in this repository.

This repo is a curated list. There is no build, no tests, no source code — the deliverable is `README.md` and its Chinese counterpart. Treat prose accuracy the way you would treat a failing test.

## Hard rules

1. **Never invent a link.** Every URL you add must be fetched and confirmed to return 200 before it goes in the file. If you cannot verify it, do not add it. A fabricated entry is worse than a missing one.
2. **Never invent a description.** Describe what the project actually does, based on its README or docs — not on the name, and not on the repo's own marketing copy.
3. **Edit both READMEs.** `README.md` (English, primary) and `README.zh-CN.md` (Chinese) must stay in sync: same sections, same entries, same order. An entry in one and not the other is a bug.
4. **Do not commit or push** unless explicitly asked.

## Entry format

```markdown
- [Name](https://url) — What it does, in one sentence. `(Tag)`
```

- Em dash `—` separates link and description. Not a hyphen, not a colon.
- Description: one sentence, capitalized, ends with a period.
- Tags: `(Official)` for OpenAI, `(Chinese)` for Chinese-language resources, `(Paid)` for paid/freemium. No tag means community/open source.
- Within a section, order by usefulness. Official docs first. Not alphabetical.

## Sections

Section order in `README.md` is the source of truth; `README.zh-CN.md` mirrors it. The table of contents at the top must match the actual headings — anchors are generated from heading text, so update both together.

Do not create a new section unless you have at least three entries for it. Fewer than that, put them in the closest existing section.

This constraint governs **adding** sections, not keeping them. An existing section that shrinks below three entries stays — removing a bad entry must never create pressure to keep it, or to pad the section with a worse one. Delete a section only when it has no entries left, or when the topic itself has stopped mattering.

## Verifying changes

After any edit to a README, run:

```bash
./scripts/check-links.sh
```

It extracts every URL from both READMEs and reports non-200 responses. Paste the real output when reporting completion — do not summarize it.

## Weekly update workflow

The maintenance process lives in [OPERATIONS.md](OPERATIONS.md). The short version: `INBOX.md` accumulates candidates during the week; on Sunday they are filtered against the bar in [CONTRIBUTING.md](CONTRIBUTING.md), written into both READMEs, and recorded in [CHANGELOG.md](CHANGELOG.md).

`INBOX.md` is gitignored — it is the maintainer's local scratchpad and will not exist in a fresh clone. If it is missing, that is expected, not an error. Never commit it, and never reconstruct it from the changelog.

When asked to "do the weekly update," follow that SOP rather than improvising.

## What not to do

- Do not pad the list. Fewer, better entries is the entire strategy.
- Do not add star counts or "150+ tools" style claims — they go stale and this list does not compete on volume.
- Do not remove the "Related Awesome Lists" section. Linking competitors honestly is deliberate.
- Do not rewrite `OPERATIONS.md` into marketing language. It is an internal document and is meant to be blunt.
