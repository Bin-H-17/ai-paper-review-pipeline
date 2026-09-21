# Paper Review Pipeline / 论文审稿全流程

> 论文审稿 Skill：把 P0–P8 全流程拆成可执行阶段，产出结构化审稿报告。
> **EN**: A paper-review skill: the P0–P8 pipeline as executable stages, producing a structured review report.

[中文](#中文) | [English](#english)

---

## 中文

### 简介

本仓库是一套论文审稿 Skill，用于按期刊/会议审稿标准对稿件做系统性审查。入口是 `SKILL.md`，执行细则在 `PIPELINE.md`。

作者根据自身需求定制并在合理范围内扩展完善，最终产出此 skill。

全流程分成 P0–P8 阶段，每阶段的输入、产出路径与判定标准写在 `PIPELINE.md` 中。各阶段结果汇总到 `MASTER_REPORT.md`。

### 流程

| 阶段 | 内容 | 产出 |
|------|------|------|
| P0 | 材料读取（PDF / 扫描件 OCR） | 正文文本 |
| P1 | 机械预检 | `01-quick-audit/` |
| P1b | TeX 参考文献核验（有 tex + bib 时） | `01b-bib-verify/` |
| P2 | 查新：抽取 3–5 条主张 → 检索 → 核验 | `NOVELTY_DOSSIER.md` |
| P3 | 深度审稿 + 对抗性总览（六栏） | `03-deep-review/ADVERSARIAL_OVERVIEW.md` |
| P3b | 修辞偏见剥离审查 | `03b-rhetoric-debias/RHETORIC_DEBIAS.md` |
| P4 | 数学证明与推导洞检 | 见 `skills/math-proof-check/` |
| P4b | 图表审查与生成（可选） | — |
| P5 | 代码验证（有代码才跑） | `05-code-verify/REPORT.md` |
| P6 | 受控改稿 | 变更清单 applied / proposed |
| P7–P8 | 门控 + 汇总 | `MASTER_REPORT.md` |

对抗性总览固定六栏：数学逻辑自洽、实验是否合理、数据与结论是否合理、叙事是否成立、真问题与整篇意义、修辞偏见攻击。每栏给出最强攻击、文中锚点、是否站得住、最小补救。

P3b 依据论文 *How Can Rhetoric Reward-Hack AI Reviewers?*（arxiv 2608.08975）的结论设计：先剥离修辞层，再看裸证据与裸逻辑，降低「表达好即给高分」的偏差。

### 目录结构

```
ai-paper-review-pipeline/
├── SKILL.md                        # 入口：触发条件与阶段路由
├── PIPELINE.md                     # P0–P8 执行细则
├── prompts/                        # 各阶段提示词
│   ├── adversarial-overview.md     # P3 对抗性总览（六栏）
│   ├── rhetoric-debias.md          # P3b 修辞偏见剥离
│   ├── proof.md                    # P4 数学洞检路由
│   ├── novelty.md                  # P2 查新
│   ├── code-verify.md              # P5 代码验证
│   ├── edit-policy.md              # P6 改稿策略
│   └── lean-l4.md                  # L4 形式化验证说明（默认关闭）
├── checklists/
│   ├── master.md                   # 完成前核对
│   └── modeling-contest.md         # 数学建模竞赛稿附加清单
├── templates/
│   └── MASTER_REPORT.md            # 汇总报告模板
├── skills/
│   └── math-proof-check/           # 数学证明洞检子 skill（v1.2.0）
└── lean/
    └── MathReview/                 # Lean 4 骨架（默认不调用）
```

### 使用

1. 把仓库内容放入所用平台的 skill 目录（各平台路径不同）。
2. 触发方式：说明审稿意图并给出稿件路径，例如「审稿 + `paper.tex`」。裸触发词默认跑 P0–P8 全流程。
3. 也可单独使用子 skill：`skills/math-proof-check/` 可脱离主流程，用于单篇证明或推导的洞检。

### 依赖

- 外部 skill（按需对接，均非本仓库内容）：`pdf-reader`、`pdf-ocr`、`paper-audit`、`semantic-scholar`、`arxiv`、`research-lit`、`novelty-check`、`latex-paper-en`；图表阶段可用 `academic-plotting`、`scientific-visualization`、`tikz-scientific-figures`。
- `VERIFY_PAPERS_SCRIPT`：查新核验脚本路径，使用前按本机情况替换为占位符对应的实际路径。脚本不可用时，改由当前模型审阅 dossier，未验证项须标注。
- 可选：Python 3 与 SymPy / Z3 / Hypothesis，用于数学洞检的计算核验。

### 限制

- 审稿结论为 LLM 对抗式洞检，不替代形式化证明或人工终审。
- 不代做实验，只列实验清单。
- 无代码时不新写实验代码。
- 默认关闭 Lean / L4 形式化验证。
- P6 改稿仅适用于 `AUTO_FIX_ELIGIBLE` 条目，且不覆盖原稿。

### 许可证

[MIT](LICENSE)。Copyright (c) 2026 B.Han.

---

## English

### Overview

A paper-review skill for systematic review of manuscripts against journal / conference review standards. `SKILL.md` is the entry point; `PIPELINE.md` holds the execution details.

The author built this for personal use and extended it within reasonable scope into the skill published here.

The workflow is split into stages P0–P8, each with fixed inputs, output paths, and decision criteria defined in `PIPELINE.md`. Stage results are consolidated into `MASTER_REPORT.md`.

### Pipeline

| Stage | Content | Output |
|-------|---------|--------|
| P0 | Material intake (PDF / scanned OCR) | Manuscript text |
| P1 | Mechanical pre-check | `01-quick-audit/` |
| P1b | TeX bibliography verification (when tex + bib present) | `01b-bib-verify/` |
| P2 | Novelty check: extract 3–5 claims → search → verify | `NOVELTY_DOSSIER.md` |
| P3 | Deep review + adversarial overview (six columns) | `03-deep-review/ADVERSARIAL_OVERVIEW.md` |
| P3b | Rhetoric-debias review | `03b-rhetoric-debias/RHETORIC_DEBIAS.md` |
| P4 | Math proof / derivation audit | see `skills/math-proof-check/` |
| P4b | Figure and table review, generation (optional) | — |
| P5 | Code verification (only when code exists) | `05-code-verify/REPORT.md` |
| P6 | Controlled revision | Applied / proposed change list |
| P7–P8 | Gate + consolidation | `MASTER_REPORT.md` |

The adversarial overview has six fixed columns: mathematical self-consistency, experimental soundness, data–conclusion soundness, narrative validity, real problem and overall significance, and rhetorical-bias attack. Each column reports the strongest attack, the anchor in the manuscript, whether it holds, and the minimal remedy.

P3b follows the findings of *How Can Rhetoric Reward-Hack AI Reviewers?* (arxiv 2608.08975): strip the rhetorical layer first, then judge the bare evidence and bare logic, reducing the bias toward scoring well-written papers higher.

### Repository layout

```
ai-paper-review-pipeline/
├── SKILL.md                        # Entry: triggers and stage routing
├── PIPELINE.md                     # P0–P8 execution details
├── prompts/                        # Per-stage prompts
│   ├── adversarial-overview.md     # P3 adversarial overview (six columns)
│   ├── rhetoric-debias.md          # P3b rhetoric-debias review
│   ├── proof.md                    # P4 math audit routing
│   ├── novelty.md                  # P2 novelty check
│   ├── code-verify.md              # P5 code verification
│   ├── edit-policy.md              # P6 revision policy
│   └── lean-l4.md                  # L4 formal verification notes (disabled by default)
├── checklists/
│   ├── master.md                   # Pre-completion checklist
│   └── modeling-contest.md         # Extra checklist for modeling-contest papers
├── templates/
│   └── MASTER_REPORT.md            # Consolidated report template
├── skills/
│   └── math-proof-check/           # Math proof audit sub-skill (v1.2.0)
└── lean/
    └── MathReview/                 # Lean 4 skeleton (not invoked by default)
```

### Usage

1. Place the repository contents into the skills directory of the target platform (the path differs per platform).
2. Invoke with a review intent plus the manuscript path, e.g. "review + `paper.tex`". A bare trigger word runs the full P0–P8 pipeline.
3. The sub-skill can also be used standalone: `skills/math-proof-check/` audits a single proof or derivation outside the main pipeline.

### Dependencies

- External skills (integrated on demand, not part of this repository): `pdf-reader`, `pdf-ocr`, `paper-audit`, `semantic-scholar`, `arxiv`, `research-lit`, `novelty-check`, `latex-paper-en`; the figure stage can use `academic-plotting`, `scientific-visualization`, `tikz-scientific-figures`.
- `VERIFY_PAPERS_SCRIPT`: path to the novelty verification script. Replace the placeholder with the actual local path before use. When the script is unavailable, the current model reviews the dossier and unverified items must be flagged.
- Optional: Python 3 with SymPy / Z3 / Hypothesis for computational checks in the math audit.

### Limitations

- Review conclusions are adversarial LLM audits; they do not replace formal proof or human final review.
- Experiments are not performed; the pipeline only lists an experiment checklist.
- No experiment code is written when a manuscript has none.
- Lean / L4 formal verification is disabled by default.
- P6 revision applies only to `AUTO_FIX_ELIGIBLE` items and does not overwrite the original file.

### License

[MIT](LICENSE). Copyright (c) 2026 B.Han.
