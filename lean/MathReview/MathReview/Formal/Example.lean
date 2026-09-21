/-
  示例：可被内核检查的平凡引理。
  真正的 CORE 定理请按 core-theorems.yml 新增 Formal/<id>.lean，
  并先做「原命题 ↔ Lean 陈述」对齐检查。
-/
import Mathlib

namespace MathReview.Formal.Example

theorem two_add_two : (2 : ℕ) + 2 = 4 := by
  native_decide

end MathReview.Formal.Example
