---
name: math-proof-check
description: >-
  Adversarial math proof/derivation audit: normalize statement, counterexample-first,
  atomize steps, optional SymPy/Z3/Hypothesis, evidence levels L0–L3 (Lean/L4 disabled),
  fixed verdicts, and mark AUTO_FIX_ELIGIBLE vs PROPOSED_CHANGE. Does not overwrite the
  original file; eligible fixes go to a revised copy then re-audit with rollback on
  failure. Use for 推导/证明挑洞 or as P4 in paper-review-pipeline.
when_to_use: >-
  证明审查、推导挑洞、先证伪、证据等级、裁决态、AUTO_FIX、数学逐步审核、P4
metadata:
  category: academic-writing
  version: "1.2.0"
  last_updated: "2026-07-29"
argument-hint: "[path] [--sympy auto|off] [--z3 auto|off] [--hypothesis auto|off] [--autofix auto|off] [--out DIR]"
allowed-tools: Read, Write, Edit, Glob, Grep, Bash, Task
---

# Math Proof Check v1.2

**位置：** `skills/math-proof-check/`  
改稿细则：`prompts/edit-policy.md`  
要点：`prompts/proof.md`

## 强制执行顺序（不可跳）

1. 保存/引用**原稿路径**，永不覆盖原稿  
2. 规范化命题（变量、定义域、量词、显式/隐含假设、结论）；投稿策略级歧义 → 问用户；纯符号歧义可分支  
3. **先证伪**（见下）  
4. 原子步骤 S1… + 依赖图  
5. 逐步逻辑检查  
6. 可计算步调用工具（SymPy/Z3/Hypothesis，auto）；**不要跑 Lean/L4**（用户已关闭）  
7. 每条发现标**证据等级**（最高到 L3）  
8. 给出**固定裁决态**（原稿）  
9. 识别 `AUTO_FIX_ELIGIBLE` vs `PROPOSED_CHANGE`（`--autofix auto` 默认开）  
10. 对 ELIGIBLE：写入**独立修订稿** + 变更清单（不改原稿）  
11. 对修订稿再跑相关块完整审核；失败 → 回滚该改 → PROPOSED  
12. 输出：**原稿裁决** +（若有）**修订稿裁决**

## 先证伪

接受原证明思路前必须尝试推翻命题：自相矛盾假设；0/1/-1/边界/奇点；空集/单点/零函数/常值；零/奇异/低维矩阵；量词顺序；缺正性/连续/可微/可积/紧致等；工具：枚举/随机/优化反例/Z3/高精度。  
候选反例：验证满足全部假设 → 第二种方法复核 → 保存 → 可标 `REFUTED` → **仍定位原证明最早错步**。

## 证据等级 / 裁决 / 工具

见 `references/evidence-levels.md`、`verdicts.md`、`tools-optional.md`、`sympy-when.md`。  
L0 不得自动改数学；L2 可支撑反例，不能当一般证明；默认无 Lean。

## 产出

`proof-check/` 下：`REPORT.md`、`summary.json`、`blocks/*`、`TODO-recheck.md`、  
`applied-changes.md`、`proposed-changes.md`、`changes.json`、（若有）`revised/`、`verification-after-edit.md`。

## 与全流程

整篇审稿 → `paper-review-pipeline` 的 P4（本 skill）+ P6（统一改稿政策，与本 skill autofix 对齐）。  
仅证明 → 只跑本 skill。
