import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure PhaseDiagram where
  components : List String
  temperatureRange : ℝ × ℝ
  pressureRange : ℝ × ℝ
  phases : List String
  phaseBoundaries : List (String × String)
  componentsDefined : Prop
  temperatureRangeValid : Prop
  pressureRangeValid : Prop
  phasesIdentified : Prop
  phaseBoundariesMapped : Prop
  diagramEvidence : PhaseDiagramEvidence

structure PhaseDiagramEvidence where
  componentsDefinedClosed : componentsDefined
  temperatureRangeValidClosed : temperatureRangeValid
  pressureRangeValidClosed : pressureRangeValid
  phasesIdentifiedClosed : phasesIdentified
  phaseBoundariesMappedClosed : phaseBoundariesMapped

def PhaseDiagramClosed (P : PhaseDiagram) : Prop :=
  P.componentsDefined ∧ P.temperatureRangeValid ∧ P.pressureRangeValid ∧
  P.phasesIdentified ∧ P.phaseBoundariesMapped

theorem phase_diagram_closed_from_evidence (P : PhaseDiagram) (E : PhaseDiagramEvidence) :
    PhaseDiagramClosed P := by
  exact And.intro E.componentsDefinedClosed
    (And.intro E.temperatureRangeValidClosed
      (And.intro E.pressureRangeValidClosed
        (And.intro E.phasesIdentifiedClosed E.phaseBoundariesMappedClosed)))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse