import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  componentsDefined : Prop
  phasesDefined : Prop
  thermodynamicVariables : Prop
  phaseBoundaryCurves : Prop
  eutecticPoint : Prop
  leverRuleApplicable : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  componentsDefinedClosed : P.componentsDefined
  phasesDefinedClosed : P.phasesDefined
  thermodynamicVariablesClosed : P.thermodynamicVariables
  phaseBoundaryCurvesClosed : P.phaseBoundaryCurves
  eutecticPointClosed : P.eutecticPoint
  leverRuleApplicableClosed : P.leverRuleApplicable

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.componentsDefined ∧ P.phasesDefined ∧ P.thermodynamicVariables ∧
  P.phaseBoundaryCurves ∧ P.eutecticPoint ∧ P.leverRuleApplicable

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.componentsDefinedClosed
    (And.intro E.phasesDefinedClosed
      (And.intro E.thermodynamicVariablesClosed
        (And.intro E.phaseBoundaryCurvesClosed
          (And.intro E.eutecticPointClosed E.leverRuleApplicableClosed))))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse
