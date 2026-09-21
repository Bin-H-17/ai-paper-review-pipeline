# 输出模板

## `proof-check/00-blocks-index.md`

```markdown
# Blocks Index
- 材料：<绝对路径>
- 时间：<ISO>
- 模式：Round1 AI-only

| ID | 类型 | 标题/首句 | 源位置 | 状态 |
|----|------|-----------|--------|------|
| B01 | theorem | ... | L..-L.. | reviewed |
```

## `proof-check/blocks/<id>-assumptions.md`

```markdown
# Assumptions — <id>
1. ...
2. ...
```

## `proof-check/blocks/<id>-review.md`

```markdown
# Review — <id>
## 逐步表
| 步骤编号 | 判定 | 用了哪些假设 | 引用了哪条 | 问题 | 证据等级 | 建议复核 |
|---|---|---|---|---|---|---|

## 隐含假设补丁
- ...

## SymPy 复核（如有）
- ...

## 块级结论
- ...
```

## `proof-check/summary.json`

```json
{
  "verdict": "NO_DEFECT_FOUND|PASS_WITH_GAPS|REPAIRABLE_ERROR|CRITICAL_ERROR|REFUTED|INCONCLUSIVE|INPUT_INVALID",
  "highest_evidence_level": "L0|L1|L2|L3",
  "counterexample_found": false,
  "tools_used": ["sympy?", "z3?", "hypothesis?"],
  "completed": true
}
```

## `proof-check/REPORT.md`

```markdown
# Math Proof Check — Round 1
- 材料：...
- 裁决态：...
- 最高证据等级：...
- 块数：...
- Critical：n / Major：n / Minor：n

## Top findings（按严重度）
1. [Critical][Bid][Sx] ...

## 分块摘要
| ID | 结论 | Critical | Major | Minor |
|----|------|----------|-------|-------|

## 限制声明
本报告为 LLM 对抗式洞检，不能替代形式化证明或人工终审。

## 范围说明
- 实验不由本流程代做，最多列实验清单。
- 实验与数据尽量保留在正文或附录，便于复现。
- Round 1 只负责找洞，不背书正确性。
```

## `proof-check/TODO-recheck.md`

仅列 `可疑`/`错` 行，便于第二轮（人 / SymPy / 对书）。
