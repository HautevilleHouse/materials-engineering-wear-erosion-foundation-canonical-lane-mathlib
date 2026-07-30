import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure ErosionModel where
  erosionRate : ℝ
  particleVelocity : ℝ
  particleSize : ℝ
  impactAngle : ℝ
  materialRemoval : ℝ
  erosionEquationValid : Prop
  particleVelocityMeasured : Prop
  particleSizeRecorded : Prop
  impactAngleRecorded : Prop
  materialRemovalComputed : Prop
  erosionEvidence : ErosionModelEvidence

structure ErosionModelEvidence where
  erosionEquationValidClosed : erosionEquationValid
  particleVelocityMeasuredClosed : particleVelocityMeasured
  particleSizeRecordedClosed : particleSizeRecorded
  impactAngleRecordedClosed : impactAngleRecorded
  materialRemovalComputedClosed : materialRemovalComputed

def ErosionModelClosed (E : ErosionModel) : Prop :=
  E.erosionEquationValid ∧ E.particleVelocityMeasured ∧ E.particleSizeRecorded ∧
  E.impactAngleRecorded ∧ E.materialRemovalComputed

theorem erosion_model_closed_from_evidence (E : ErosionModel) (Ev : ErosionModelEvidence) :
    ErosionModelClosed E := by
  exact And.intro Ev.erosionEquationValidClosed
    (And.intro Ev.particleVelocityMeasuredClosed
      (And.intro Ev.particleSizeRecordedClosed
        (And.intro Ev.impactAngleRecordedClosed Ev.materialRemovalComputedClosed)))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse