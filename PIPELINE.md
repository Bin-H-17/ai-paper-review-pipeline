# 论文审稿全流程（PIPELINE）

贴合期刊/会议真人审稿。允许更好的等价实现，不得跳过或谎报。

## 触发
「审稿 / review / 全面审 / 投稿前体检 / 把把关 / 看看能不能投 / 出审稿意见 / 走一遍审稿」  
→ skill **`paper-review-pipeline`**，本文件执行。裸「审稿」= **P0–P8 全开**。

| 用户只要… | 跑 |
|-----------|-----|
| 证明/推导洞 | 仅 `math-proof-check` |
| 查新 | 仅 P2 |
| 能不能投 | P0→P1→P7（注明未跑项） |

产出根：稿件旁或工作目录 `review-pipeline/`。

### P0 材料
`pdf-reader`；扫描件 `pdf-ocr` / `local-ocr-npu`。缺路径问一次。

### P1 机械预检
`paper-audit` quick-audit → `01-quick-audit/`

### P1b TeX bib（有 tex+bib）
`latex-paper-en` bibliography → `01b-bib-verify/`

### P2 查新
`semantic-scholar` + `arxiv` + `research-lit` →  
`python ${VERIFY_PAPERS_SCRIPT}` → `novelty-check`  
未 verified → `[UNVERIFIED]`。无 S2 key 也跑。禁编造 ID/DOI/标题。见 `prompts/novelty.md`。

### P3 深度审稿 + 对抗性总览
1. `paper-audit` deep-review `--focus full` → `03-deep-review/`  
2. **必须**按 `prompts/adversarial-overview.md` 写出  
   `03-deep-review/ADVERSARIAL_OVERVIEW.md`（六栏攻击面 + Claim Risk）。  
3. 建模赛稿件另勾 `checklists/modeling-contest.md`，结果附在概述文末。

### P3b 修辞偏见剥离审查（2026-08-21 新增）
> 依据：arxiv 2608.08975，AI 审稿对证据呈现/创新性表述/研究范围高度敏感。

按 `prompts/rhetoric-debias.md` 对论文做修辞剥离审稿：  
- 剥掉修辞层，基于裸证据重新评估三大高敏感维度  
- 产出 `03b-rhetoric-debias/RHETORIC_DEBIAS.md`  
- 偏见风险评估写入 MASTER_REPORT  
- 若论文本身表达朴素、无修辞包装，可标注「低偏见风险」并跳过详细审查

### P4 数学
`math-proof-check`（`skills/math-proof-check/`）：先证伪→L0–L3→裁决→AUTO_FIX。**禁止 Lean/L4。** 见 `prompts/proof.md`。  
优先消化 `ADVERSARIAL_OVERVIEW` 栏 1 指出的证明块。

### P5 代码（条件）
有代码才验；无代码不写新代码。见 `prompts/code-verify.md`。

### P6 受控改稿
仅 `AUTO_FIX_ELIGIBLE`；原稿不覆盖；再审；失败回滚。  
新增 `RHETORIC_OPTIMIZATION` 类别（修辞优化，需用户确认）。  
见 `prompts/edit-policy.md`。

### P7–P8
gate + `templates/MASTER_REPORT.md`（**含对抗性六栏摘要与建模赛附加**）；对照 `checklists/master.md`。

## 论文绘图（非审稿主链）
结构/流程类 → `drawio` / `academic-plotting` / `tikz-scientific-figures`；数据图 → `academic-plotting` / `scientific-visualization`。
