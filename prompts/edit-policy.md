# 改稿（P6）
「百分百确定」= **AUTO_FIX_ELIGIBLE**（定位到式子；L3 或无语义排版笔误；修复唯一；不改假设/量词/定义域/结论范围；局部+下游+再审通过）。  
否则 PROPOSED。永不覆盖原稿。L0 不得改数学。详见变更清单 applied/proposed。

## 修辞优化类别（RHETORIC_OPTIMIZATION）（2026-08-21 新增）

> 依据：arxiv 2608.08975，证据呈现为 AI 审稿最高敏感维度（单项最高涨 0.93 分）。
> 此类别**不改数值/方法/实验**，仅优化已有结果的讲述方式。

### 适用场景

由 P3b `rhetoric-debias` 审查产出驱动，针对以下三个高敏感维度：

1. **证据呈现优化**（最高 ROI）
   - 不改已有数值及其含义
   - 优化：方法 vs 基线的对比表述、跨指标一致性的强调、已有差距的实际意义讨论
   - 标记为 `RHETORIC_OPTIMIZATION:EVIDENCE`

2. **创新性表述强化**
   - 在 P2 查新结论允许的范围内，更明确地陈述已有贡献
   - 不得声称查新结论不支撑的 novelty
   - 标记为 `RHETORIC_OPTIMIZATION:NOVELTY`

3. **研究范围描述检查**
   - 删除不必要的 scope limitation 声明
   - 确保声称的适用范围被实验覆盖
   - 标记为 `RHETORIC_OPTIMIZATION:SCOPE`

### 与 AUTO_FIX 的关系

- `RHETORIC_OPTIMIZATION` 改动**不自动应用**
- 写入 `applied-rhetoric-optimizations.md`（独立于 applied/proposed）
- 用户确认后才合并到修订稿
- 与逻辑修复分开列出，让用户选择性采纳

### 禁止

- 不得为涨分而夸大证据
- 不得添加论文中没有的数值或结论
- 不得在查新结论不支撑的情况下强化 novelty 声称
