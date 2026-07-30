import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure CrystallographyPackage where
  bravaisLattice : Type u
  motif : Type v
  unitCellGeometry : Prop
  braggCondition : Prop
  structureFactorAmplitude : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  unitCellGeometryClosed : C.unitCellGeometry
  braggConditionClosed : C.braggCondition
  structureFactorAmplitudeClosed : C.structureFactorAmplitude

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.unitCellGeometry ∧ C.braggCondition ∧ C.structureFactorAmplitude

theorem crystallography_closed_from_evidence (C : CrystallographyPackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.unitCellGeometryClosed
    (And.intro E.braggConditionClosed E.structureFactorAmplitudeClosed)

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse
