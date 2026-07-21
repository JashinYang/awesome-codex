# Contributing

Thanks for wanting to add something. This list stays useful only because the bar is high, so please read this before opening a PR.

## The bar

An entry gets in if it clears **all four**:

1. **Codex-specific.** It works with OpenAI Codex, and that is not an afterthought. A generic AI tool that happens to mention Codex in a feature matrix does not qualify. MCP servers are the exception — they work with Codex by protocol, so a genuinely useful one is fine.
2. **Alive.** Committed to within the last ~6 months, or it is official documentation. Codex changes fast; a tool that stopped tracking it is a liability, not a resource.
3. **Someone used it.** Either the submitter used it, or the maintainer will before merging. "It has a lot of stars" is not a reason.
4. **One honest sentence.** What it does and when you would reach for it. Not the repo's own marketing copy.

Things that will be rejected: link farms, paid courses without free substance, anything requiring signup to evaluate, another awesome-list of awesome-lists, and AI-generated tool descriptions.

## Format

```markdown
- [Name](https://url) — What it does, in one sentence. `(Tag)`
```

- Em dash (`—`) between the link and the description, not a hyphen.
- Description starts with a capital letter and ends with a period.
- Tags: `(Official)` `(Chinese)` `(Paid)`. No tag means community/open source. Multiple tags are space-separated.
- Entries within a section are ordered by usefulness, not alphabetically. Official docs first.
- Add to **both** `README.md` and `README.zh-CN.md`. If you cannot write the Chinese, say so in the PR and it will be added on merge.

## Submitting

1. Fork, branch, edit.
2. Run the link checker: `./scripts/check-links.sh`
3. Open a PR. In the description, answer: **have you used this, and for what?**

One entry per PR is preferred. It makes rejection cheap and merges fast.

## Removing entries

Removal PRs are as welcome as additions. If a link is dead, a project is abandoned, or an entry turned out to be bad, open a PR that deletes it. Say why. This list gets better by shrinking as often as by growing.

## Reporting problems without a PR

Open an issue. Dead links, wrong descriptions, and missing tags are all worth reporting even if you do not want to write the fix.
