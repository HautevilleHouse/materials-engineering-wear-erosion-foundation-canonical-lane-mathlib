import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsEngineeringWearErosionFoundationCanonicalLaneLean.AbrasiveWearModel

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure FiniteElementWearPackage {W : WearSurfacePackage} {A : AbrasiveWearPackage W} where
  meshQuality : Prop
  contactAlgorithm : Prop
  wearIncrementModel : Prop
  geometryUpdate : Prop
  convergenceCriterion : Prop

structure FiniteElementWearEvidence {W : WearSurfacePackage} {A : AbrasiveWearPackage W}
    (F : FiniteElementWearPackage W A) where
  meshQualityClosed : F.meshQuality
  contactAlgorithmClosed : F.contactAlgorithm
  wearIncrementModelClosed : F.wearIncrementModel
  geometryUpdateClosed : F.geometryUpdate
  convergenceCriterionClosed : F.convergenceCriterion

def FiniteElementWearClosed {W : WearSurfacePackage} {A : AbrasiveWearPackage W}
    (F : FiniteElementWearPackage W A) : Prop :=
  F.meshQuality ∧ F.contactAlgorithm ∧ F.wearIncrementModel ∧
  F.geometryUpdate ∧ F.convergenceCriterion

theorem finite_element_wear_closed_from_evidence {W : WearSurfacePackage} {A : AbrasiveWearPackage W}
    (F : FiniteElementWearPackage W A) (E : FiniteElementWearEvidence F) :
    FiniteElementWearClosed F := by
  exact And.intro E.meshQualityClosed
    (And.intro E.contactAlgorithmClosed
      (And.intro E.wearIncrementModelClosed
        (And.intro E.geometryUpdateClosed E.convergenceCriterionClosed)))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse