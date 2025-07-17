import Mathlib.Tactic
import Analysis.Misc.UnitsSystem

open UnitsSystem
variable [UnitsSystem]

-- Many algebraic identities involving `Scalar` can be established by first using `←toFormal_inj`
-- to coerce to `Formal`, using `simp` to push coercions inside, then appealing to `ring`.  We give some examples below.

theorem UnitsSystem.Scalar.hMul_assoc {d₁ d₂ d₃:Dimensions} (a:Scalar d₁) (b:Scalar d₂) (c:Scalar d₃):
  a * (b * c) = ((a * b) * c).cast := by
  simp [←toFormal_inj]; ring

theorem UnitsSystem.Scalar.left_distrib {d₁ d₂:Dimensions} (a:Scalar d₁) (b c:Scalar d₂) :
  a * (b + c) = (a * b) + (a * c) := by
  simp [←toFormal_inj]; ring

theorem UnitsSystem.Scalar.right_distrib {d₁ d₂:Dimensions} (a b:Scalar d₁) (c:Scalar d₂) :
  (a + b) * c = (a * c) + (b * c) := by
  simp [←toFormal_inj]; ring

theorem UnitsSystem.Scalar.sq_add {d:Dimensions} (a b:Scalar d) : (a+b)**2 = a**2 + (2 • a * b).cast + b**2 := by
  simp [←toFormal_inj]; ring
