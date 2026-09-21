# MathReview — Lean 4 + Mathlib 骨架（L4）

> 安装 elan/Lean 后，在本目录执行：
> `lake update`
> `lake build`
>
> 当前为可编辑骨架；未装 Lean 时不要假装已验证。

## 布局

```
MathReview/
  lakefile.lean
  lean-toolchain
  MathReview.lean
  MathReview/Formal/   # 每个 CORE 一条 .lean
  README.md
```

## 命令

```powershell
cd "\lean\MathReview"
lake env lean Formal/Example.lean
lake build
```
