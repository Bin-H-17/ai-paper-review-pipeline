---
name: paper-review-pipeline
description: >-
  MUST run full P0–P8 review when user says 审稿/全面审/投稿前体检/把把关/出审稿意见/review paper
  with a target manuscript. Orchestrates paper-audit, novelty-check+verify_papers,
  math-proof-check (no Lean), adversarial overview (6 attack columns incl. rhetoric-debias), rhetoric-debias (P3b), modeling-contest
  checklist when applicable, code verify only if code exists, AUTO_FIX revisions + RHETORIC_OPTIMIZATION,
  gate and MASTER_REPORT. Always read PIPELINE.md. Do not stop at
  chat-only critique.
when_to_use: >-
  审稿、全面审、投稿前体检、把把关、看看能不能投、出审稿意见、走一遍审稿、review my paper
metadata:
  version: "1.4.0"
  last_updated: "2026-08-21"
argument-hint: "[paper.tex|paper.pdf|project-dir]"
---

# Paper Review Pipeline v1.4

## 触发即全流程

用户说「审稿」类意图 + 目标文件/项目 → **P0–P8 必须整遍跑完**。  
细则唯一源：`PIPELINE.md`。  
**Lean/L4 关闭。** 无 S2 key 仍跑查新（限流、UNVERIFIED 规则照旧）。

## 路由

| 阶段 | Skill / 工具 |
|------|----------------|
| P0 | pdf-reader；扫描件 pdf-ocr / local-ocr-npu |
| P1 | paper-audit quick-audit |
| P1b | latex-paper-en bibliography |
| P2 | semantic-scholar + arxiv + research-lit → `${VERIFY_PAPERS_SCRIPT}` → novelty-check |
| P3 | paper-audit deep-review `--focus full` + **`prompts/adversarial-overview.md`** → `ADVERSARIAL_OVERVIEW.md`（六栏）；建模赛另勾 `checklists/modeling-contest.md` |
| P3b | **`prompts/rhetoric-debias.md`** → `RHETORIC_DEBIAS.md`（修辞偏见剥离审查，基于 arxiv 2608.08975） |
| P4 | math-proof-check（无 Lean）；优先消化概述栏 1 |
| P4b | 图表审查/生成：academic-plotting / scientific-visualization / tikz-scientific-figures（图有问题或要重画时启用） |
| P5 | 有代码才验 |
| P6 | edit-policy AUTO_FIX + RHETORIC_OPTIMIZATION（需用户确认） |
| P7–P8 | gate + MASTER（含六栏摘要 + 修辞偏见审查） |

完成前核对 `checklists/master.md`。
