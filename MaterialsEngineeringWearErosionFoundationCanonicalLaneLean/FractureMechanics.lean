import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure FractureMechanics where
  stressIntensityFactor : ℝ
  criticalStressIntensityFactor : ℝ
  crackLength : ℝ
  fractureToughness : ℝ
  failureCriterion : String
  stressIntensityFactorComputed : Prop
  criticalStressIntensityFactorMeasured : Prop
  crackLengthRecorded : Prop
  fractureToughnessDerived : Prop
  failureCriterionSet : Prop
  fractureEvidence : FractureMechanicsEvidence

structure FractureMechanicsEvidence where
  stressIntensityFactorComputedClosed : stressIntensityFactorComputed
  criticalStressIntensityFactorMeasuredClosed : criticalStressIntensityFactorMeasured
  crackLengthRecordedClosed : crackLengthRecorded
  fractureToughnessDerivedClosed : fractureToughnessDerived
  failureCriterionSetClosed : failureCriterionSet

def FractureMechanicsClosed (F : FractureMechanics) : Prop :=
  F.stressIntensityFactorComputed ∧ F.criticalStressIntensityFactorMeasured ∧
  F.crackLengthRecorded ∧ F.fractureToughnessDerived ∧ F.failureCriterionSet

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanics) (E : FractureMechanicsEvidence) :
    FractureMechanicsClosed F := by
  exact And.intro E.stressIntensityFactorComputedClosed
    (And.intro E.criticalStressIntensityFactorMeasuredClosed
      (And.intro E.crackLengthRecordedClosed
        (And.intro E.fractureToughnessDerivedClosed E.failureCriterionSetClosed)))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse