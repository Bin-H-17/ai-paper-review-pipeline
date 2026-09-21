import Lake
open Lake DSL

package «MathReview» where
  -- add package configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.14.0"

@[default_target]
lean_lib «MathReview» where
  -- add library configuration options here
