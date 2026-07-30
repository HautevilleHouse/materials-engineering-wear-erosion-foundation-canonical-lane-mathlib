import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure CrystalStructure where
  latticeType : Type u
  basisVectors : List (ℝ × ℝ × ℝ)
  symmetryGroup : String
  unitCellVolume : ℝ
  meltingPoint : ℝ
  latticeTypeDefined : Prop
  basisVectorsValid : Prop
  symmetryGroupClassified : Prop
  unitCellVolumeComputed : Prop
  meltingPointRecorded : Prop
  crystalEvidence : CrystalStructureEvidence

structure CrystalStructureEvidence where
  latticeTypeDefinedClosed : latticeTypeDefined
  basisVectorsValidClosed : basisVectorsValid
  symmetryGroupClassifiedClosed : symmetryGroupClassified
  unitCellVolumeComputedClosed : unitCellVolumeComputed
  meltingPointRecordedClosed : meltingPointRecorded

def CrystalStructureClosed (C : CrystalStructure) : Prop :=
  C.latticeTypeDefined ∧ C.basisVectorsValid ∧ C.symmetryGroupClassified ∧
  C.unitCellVolumeComputed ∧ C.meltingPointRecorded

theorem crystal_structure_closed_from_evidence (C : CrystalStructure) (E : CrystalStructureEvidence) :
    CrystalStructureClosed C := by
  exact And.intro E.latticeTypeDefinedClosed
    (And.intro E.basisVectorsValidClosed
      (And.intro E.symmetryGroupClassifiedClosed
        (And.intro E.unitCellVolumeComputedClosed E.meltingPointRecordedClosed)))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse