# 裁决态（唯一选择）

FORMALLY_VERIFIED | NO_DEFECT_FOUND | PASS_WITH_GAPS | REPAIRABLE_ERROR | CRITICAL_ERROR | REFUTED | INCONCLUSIVE | INPUT_INVALID

## 冲突优先级

1. 有效反例 → REFUTED  
2. Lean 只对 Lean 命题负责  
3. 数值通过 ≠ 证明  
4. 工具失败 ≠ 命题错误  
5. 定义域遗漏的「化简相等」→ 有条件 / REPAIRABLE 或 PASS_WITH_GAPS
