import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure WearMechanismsPackage where
  abrasiveWear : Prop
  adhesiveWear : Prop
  erosiveWear : Prop
  frettingWear : Prop
  wearRateModel : Prop

structure WearMechanismsEvidence (W : WearMechanismsPackage) where
  abrasiveWearClosed : W.abrasiveWear
  adhesiveWearClosed : W.adhesiveWear
  erosiveWearClosed : W.erosiveWear
  frettingWearClosed : W.frettingWear
  wearRateModelClosed : W.wearRateModel

def WearMechanismsClosed (W : WearMechanismsPackage) : Prop :=
  W.abrasiveWear ∧ W.adhesiveWear ∧ W.erosiveWear ∧
  W.frettingWear ∧ W.wearRateModel

theorem wear_mechanisms_closed_from_evidence (W : WearMechanismsPackage)
    (E : WearMechanismsEvidence W) : WearMechanismsClosed W := by
  exact And.intro E.abrasiveWearClosed
    (And.intro E.adhesiveWearClosed
      (And.intro E.erosiveWearClosed
        (And.intro E.frettingWearClosed E.wearRateModelClosed)))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse
