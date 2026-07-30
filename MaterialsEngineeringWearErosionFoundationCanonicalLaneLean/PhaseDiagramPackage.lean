import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  components : List Type
  temperatureRange : Prop
  pressureRange : Prop
  phaseBoundaries : Prop
  gibbsFreeEnergyModel : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  temperatureRangeClosed : P.temperatureRange
  pressureRangeClosed : P.pressureRange
  phaseBoundariesClosed : P.phaseBoundaries
  gibbsFreeEnergyModelClosed : P.gibbsFreeEnergyModel

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.temperatureRange ∧ P.pressureRange ∧ P.phaseBoundaries ∧ P.gibbsFreeEnergyModel

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.temperatureRangeClosed
    (And.intro E.pressureRangeClosed
      (And.intro E.phaseBoundariesClosed E.gibbsFreeEnergyModelClosed))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse
