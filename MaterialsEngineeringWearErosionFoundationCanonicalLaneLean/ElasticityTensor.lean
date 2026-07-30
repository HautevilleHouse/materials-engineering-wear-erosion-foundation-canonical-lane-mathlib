import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure ElasticityTensor where
  stiffnessMatrix : Matrix (Fin 6) (Fin 6) ℝ
  complianceMatrix : Matrix (Fin 6) (Fin 6) ℝ
  youngModulus : ℝ
  poissonRatio : ℝ
  shearModulus : ℝ
  stiffnessPositiveDefinite : Prop
  complianceSymmetric : Prop
  youngModulusComputed : Prop
  poissonRatioComputed : Prop
  shearModulusComputed : Prop
  elasticityEvidence : ElasticityTensorEvidence

structure ElasticityTensorEvidence where
  stiffnessPositiveDefiniteClosed : stiffnessPositiveDefinite
  complianceSymmetricClosed : complianceSymmetric
  youngModulusComputedClosed : youngModulusComputed
  poissonRatioComputedClosed : poissonRatioComputed
  shearModulusComputedClosed : shearModulusComputed

def ElasticityTensorClosed (E : ElasticityTensor) : Prop :=
  E.stiffnessPositiveDefinite ∧ E.complianceSymmetric ∧ E.youngModulusComputed ∧
  E.poissonRatioComputed ∧ E.shearModulusComputed

theorem elasticity_tensor_closed_from_evidence (E : ElasticityTensor) (Ev : ElasticityTensorEvidence) :
    ElasticityTensorClosed E := by
  exact And.intro Ev.stiffnessPositiveDefiniteClosed
    (And.intro Ev.complianceSymmetricClosed
      (And.intro Ev.youngModulusComputedClosed
        (And.intro Ev.poissonRatioComputedClosed Ev.shearModulusComputedClosed)))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse