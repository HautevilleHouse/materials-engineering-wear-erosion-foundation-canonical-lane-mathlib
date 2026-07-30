import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure CrystallographyPackage where
  latticeStructure : Type u
  unitCellVolume : Prop
  bravaisLatticeClassified : Prop
  spaceGroupSymmetries : Prop
  millerIndicesDefined : Prop
  xrdPatternIndexed : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeStructureClosed : C.latticeStructure
  unitCellVolumeClosed : C.unitCellVolume
  bravaisLatticeClassifiedClosed : C.bravaisLatticeClassified
  spaceGroupSymmetriesClosed : C.spaceGroupSymmetries
  millerIndicesDefinedClosed : C.millerIndicesDefined
  xrdPatternIndexedClosed : C.xrdPatternIndexed

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.latticeStructure ∧ C.unitCellVolume ∧ C.bravaisLatticeClassified ∧
  C.spaceGroupSymmetries ∧ C.millerIndicesDefined ∧ C.xrdPatternIndexed

theorem crystallography_closed_from_evidence (C : CrystallographyPackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.latticeStructureClosed
    (And.intro E.unitCellVolumeClosed
      (And.intro E.bravaisLatticeClassifiedClosed
        (And.intro E.spaceGroupSymmetriesClosed
          (And.intro E.millerIndicesDefinedClosed E.xrdPatternIndexedClosed))))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse
