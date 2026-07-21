# 运营执行手册

> 维护者自用。这份清单能不能活下来，取决于能不能按节奏更新，而不是首发时收了多少条。

---

## 1. 定位

一句话：**我学 Codex 的过程笔记，沉淀成一份对别人也有用的精选清单。**

### 竞争现状（2026-07-21 拉的 GitHub API 数据）

| 仓库 | Star | 最后更新 |
|---|---|---|
| hashgraph-online/awesome-codex-plugins | 688 | 活跃 |
| RoggeOhta/awesome-codex-cli | 425 | 2026-04-11，停更 3 个月 |
| KarelDO/awesome-codex | 203 | 2023-01，已死（写的是 2021 年那个 Codex 模型） |
| milisp/awesome-codex-cli | 92 | 活跃 |

赛道不空。「建个 awesome-xxx 就能涨星」在 Codex 这个词上已经不成立，先发者占了位。

### 因此差异化只有三条，其余都是噪音

1. **维护频率。** 名字第一梯队的 RoggeOhta 停更三个月，Codex 迭代速度下它的链接大概率烂了一批。持续维护本身就是护城河。
2. **中文。** 上面四个全是英文，没一个做中文。README.zh-CN 是唯一入口级差异。
3. **亲自用过的一句话点评。** 转载谁都会，「我用它干过什么」别人抄不走。

**不追求条目数量。**RoggeOhta 有 150 条，追不上也不必追。60 条活的胜过 150 条死的。

---

## 2. 周更节奏

固定发布日：**每周日 21:00 前完成并 push。**

| 时段 | 动作 | 耗时 |
|---|---|---|
| 周一~周六 | 学到/用到东西随手记进 `INBOX.md`（本地文件，不入库） | 每次 1~2 分钟 |
| 周日上半场 | 清 INBOX，筛出 3~7 条真值得收的 | 20 分钟 |
| 周日下半场 | 写进 README + README.zh-CN + CHANGELOG | 40 分钟（双语是代价） |
| 周日收尾 | 跑链接校验、commit、push | 15 分钟 |

单周目标：**3~7 条新收录 + 1 条 changelog**。低于 3 条说明这周没学，是预警。

**双语维护是这个方案的固定成本。**如果某周只来得及更一种语言，更英文版，中文版下周补齐，但不要让差距超过两周——否则中文版会腐烂成负资产，那时不如直接删掉。

---

## 3. 信息源

固定巡逻，避免"不知道写什么"：

- **官方一手**：[Codex Changelog](https://learn.chatgpt.com/docs/changelog)（每周必看）、[openai/codex releases](https://github.com/openai/codex/releases)、[Discussions](https://github.com/openai/codex/discussions)（社区项目首发地）。
- **GitHub**：Trending 搜 `codex` / `agents-md` / `mcp`；GitHub Search API 按 star 排序扫新仓库（脚本见下）。
- **自己的实践**：本周写过的 AGENTS.md 片段、配过的 hook、踩过的坑。坑 → 转成条目描述里的那句真话。
- **横向清单**：上面四个竞品，当补漏用，不照搬。

扫新仓库的一行命令：

```bash
curl -s "https://api.github.com/search/repositories?q=codex+in:name,description,topics&sort=updated&order=desc&per_page=30" \
  | python3 -c "import sys,json;[print(r['stargazers_count'], r['full_name'], (r.get('description') or '')[:80]) for r in json.load(sys.stdin)['items']]"
```

---

## 4. 周日 SOP

```
1. 打开 INBOX.md（本地暂存，已 gitignore，换机器需自己带）逐条过：这条我真用过吗？对读者有用吗？
   → 是：下一步；否：删掉，不犹豫。
2. 对照 CONTRIBUTING.md 的四条标准过一遍。
3. 归类到 README 对应分区，同步写 README.zh-CN。
4. 格式：- [Name](URL) — 一句话描述。`(标记)`
5. CHANGELOG.md 顶部加本周记录。
6. ./scripts/check-links.sh —— 有 404 当场处理，不留到下周。
7. git commit && push。
8. 可选：本周亮点发一条 X / 即刻。
```

Commit 信息：`chore(weekly): 2026-WXX — 新增 N 条（分区/分区）`

---

## 5. 度量

每月看一次，只盯这四个：

- **连续更新周数**（最重要）。先做到连续 12 周。
- **失效链接占比**。应趋近 0，这是差异化的量化证据。
- Star 增长斜率（不看绝对值）。
- 外部 PR / Issue 数：有没有人开始共建。

---

## 6. 推广

重心是持续和质量，推广是副产品。

1. **提交到 [sindresorhus/awesome](https://github.com/sindresorhus/awesome) 主索引** —— 需先通过 awesome-lint。注意主索引对同类清单收录很挑，Codex 位置可能已被占，先确认再花时间。
2. **每周亮点社媒化** —— 周更后发一条「本周 Codex 生态有什么新东西」。中文社区这类清单稀缺，是机会。
3. **openai/codex Discussions** —— 竞品 RoggeOhta 就是在那儿发的帖子涨的星。首发时发一次，之后不刷屏。

---

## 7. 退出条件

写下来是为了避免沉没成本谬误。出现以下任一情况，考虑停更或归档：

- 连续 3 周没更 —— 停更就停更，别在 README 里挂着假装活着，直接标注 archived。
- Codex 生态被官方目录完全覆盖（比如 OpenAI 自己出了完善的 registry），清单失去价值。
- 三个月内 star 增长 < 20 且无外部 PR —— 说明差异化没被认可，重新想定位或者放手。

---

*每季度回顾一次本文档。*
