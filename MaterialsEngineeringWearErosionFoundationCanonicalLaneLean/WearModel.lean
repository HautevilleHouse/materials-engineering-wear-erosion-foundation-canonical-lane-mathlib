import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure WearModel where
  wearCoefficient : ℝ
  hardness : ℝ
  normalLoad : ℝ
  slidingDistance : ℝ
  wearVolume : ℝ
  archardEquationValid : Prop
  hardnessMeasured : Prop
  normalLoadApplied : Prop
  slidingDistanceRecorded : Prop
  wearVolumeComputed : Prop
  wearEvidence : WearModelEvidence

structure WearModelEvidence where
  archardEquationValidClosed : archardEquationValid
  hardnessMeasuredClosed : hardnessMeasured
  normalLoadAppliedClosed : normalLoadApplied
  slidingDistanceRecordedClosed : slidingDistanceRecorded
  wearVolumeComputedClosed : wearVolumeComputed

def WearModelClosed (W : WearModel) : Prop :=
  W.archardEquationValid ∧ W.hardnessMeasured ∧ W.normalLoadApplied ∧
  W.slidingDistanceRecorded ∧ W.wearVolumeComputed

theorem wear_model_closed_from_evidence (W : WearModel) (E : WearModelEvidence) :
    WearModelClosed W := by
  exact And.intro E.archardEquationValidClosed
    (And.intro E.hardnessMeasuredClosed
      (And.intro E.normalLoadAppliedClosed
        (And.intro E.slidingDistanceRecordedClosed E.wearVolumeComputedClosed)))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse