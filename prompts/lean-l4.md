# Lean L4 — 默认关闭

本流程默认不使用 L4 形式化验证。

Agent **不得**安装 Lean、不得对定理跑 `lake`、不得输出 `FORMALLY_VERIFIED`。

`lean/` 目录为可选的 Lean 4 骨架，默认链路不调用；如需形式化验证，可自行接入。
