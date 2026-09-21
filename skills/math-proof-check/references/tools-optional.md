# 可选计算工具

| 包 | 用途 | 默认 |
|----|------|------|
| sympy | 恒等、微积分形式 | auto |
| mpmath | 高精度数值 | 随用 |
| scipy | 优化式搜反例 | auto 若已装 |
| z3-solver | 约束/蕴含 | auto |
| hypothesis | 属性/随机样例 | auto |
| Lean 4 + Mathlib | L4 形式化 | **关闭（用户已明确不用）** |

未装或不启用 Lean：不要尝试 L4，不要写 FORMALLY_VERIFIED。

```bash
python -c "import sympy,z3,hypothesis,mpmath,scipy; print('ok')"
```
