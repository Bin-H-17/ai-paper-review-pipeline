# P3b 修辞偏见剥离审稿（Rhetoric-Debias）

> 依据：*How Can Rhetoric Reward-Hack AI Reviewers?* (arxiv 2608.08975)
> 120 篇 ICLR 实测，4200 版本，42396 条审稿记录。
> 证据呈现、创新性表述、研究范围为 AI 审稿最高敏感维度。

## 目标

在 P3 deep-review 之后、P4 之前，对论文做一轮**修辞剥离审稿**：
先把修辞层剥掉，只看裸证据和裸逻辑，再给分。
防止「写得好就给高分」的系统性偏见污染审稿结论。

## 触发条件

- P3 deep-review 完成后**自动触发**，无需用户额外指示
- 产出写入 `03b-rhetoric-debias/RHETORIC_DEBIAS.md`

## 三大高敏感维度（必审）

### 维度 1 — 证据呈现（Evidence Presentation）

**实验发现：** 单项最高涨 0.93 分；正负版本 Weak Accept+ 比例差 13%。

审查要点：
- 剥掉「充分讲述」「全面对比」的修辞后，裸数值是否仍支撑结论？
- 方法 vs 基线的差距，是否只在特定指标/数据集上成立？
- 跨指标一致性是否被选择性呈现？（cherry-picking）
- 实际意义（practical significance）是否被修辞放大？

操作：
1. 提取论文中所有定量结果的裸数值（表格/图表）
2. 不看讨论/分析段落，仅基于数值判断：结论是否 overclaim
3. 标注：`EVIDENCE_OVERCLAIM` / `EVIDENCE_JUSTIFIED` / `EVIDENCE_UNDERSTATED`

### 维度 2 — 创新性表述（Novelty Framing）

**实验发现：** 正负版本差距 12%；主要是负向版本被扣分（谦虚有风险）。

审查要点：
- 剥掉「首次」「开创」「突破」等强修饰词后，贡献是否仍可辨认？
- 与 P2 查新结论交叉：声称的 novelty 是否有 prior 支撑？
- 贡献陈述是否过度依赖修辞而非实质差异？

操作：
1. 提取论文中所有 novelty claim
2. 逐条对照 P2 查新结论
3. 标注：`NOVELTY_INFLATED` / `NOVELTY_JUSTIFIED` / `NOVELTY_UNDERSTATED`

### 维度 3 — 研究范围（Scope）

**实验发现：** 收窄表述的损失比扩大表述的增益更明显（不对称风险）。

审查要点：
- 是否有不必要的 scope limitation 声明？（如「仅限于…」「不考虑…」）
- 声称的适用范围是否被实验覆盖？
- scope 的收窄是否导致审稿人低估贡献？

操作：
1. 提取论文中的 scope 声明
2. 对照实验设计覆盖的范围
3. 标注：`SCOPE_UNDERSOLD` / `SCOPE_APPROPRIATE` / `SCOPE_OVERSOLD`

## 三个低敏感维度（快速检查）

- **贡献突出程度**：贡献是否被充分 signpost？（弱 signposting 不会显著扣分，但无害优化）
- **技术表达正式度**：正式程度是否与目标 venue 匹配？（对 AI 审稿影响小）
- **语言复杂度**：复杂词汇/长句是否增加？（实验显示接近随机，不建议刻意调整）

## 产出格式

```markdown
# 修辞偏见剥离审稿报告

## 审稿模型偏见风险评估
- 总体偏见风险：高/中/低
- 主要风险维度：证据呈现 / 创新性表述 / 研究范围

## 维度 1：证据呈现
- 裸数值结论：EVIDENCE_OVERCLAIM / EVIDENCE_JUSTIFIED / EVIDENCE_UNDERSTATED
- 具体问题：…
- 建议：…

## 维度 2：创新性表述
- 裸贡献评估：NOVELTY_INFLATED / NOVELTY_JUSTIFIED / NOVELTY_UNDERSTATED
- 具体问题：…
- 建议：…

## 维度 3：研究范围
- 范围评估：SCOPE_UNDERSOLD / SCOPE_APPROPRIATE / SCOPE_OVERSOLD
- 具体问题：…
- 建议：…

## 低敏感维度快检
- 贡献 signposting：OK / 需加强
- 技术正式度：匹配 / 偏低 / 偏高
- 语言复杂度：适中 / 过简 / 过繁

## 对审稿结论的修正建议
（哪些审稿判断可能被修辞偏见影响，需要重新基于裸证据评估）
```

## 与其它阶段关系

- **P3 deep-review**：本阶段基于 P3 的发现，但重新从裸证据出发评估
- **P3 adversarial-overview**：栏 6「修辞偏见攻击」的详细展开
- **P6 edit-policy**：`RHETORIC_OPTIMIZATION` 类别的改写依据
- **P8 MASTER**：偏见风险评估写入 MASTER_REPORT

## 注意事项

- 本阶段**不改论文**，只做评估
- 标注必须基于证据，不得空泛判断「写得不好」
- 若论文本身表达朴素、无修辞包装，可标注「低偏见风险」并跳过详细审查
