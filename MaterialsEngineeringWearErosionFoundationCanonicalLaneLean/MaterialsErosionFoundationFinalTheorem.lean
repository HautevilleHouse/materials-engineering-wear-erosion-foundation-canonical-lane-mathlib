import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsEngineeringWearErosionFoundationCanonicalLaneLean.CrystallographyPackage
import HautevilleHouse.MaterialsEngineeringWearErosionFoundationCanonicalLaneLean.PhaseDiagramPackage
import HautevilleHouse.MaterialsEngineeringWearErosionFoundationCanonicalLaneLean.ElasticityPackage
import HautevilleHouse.MaterialsEngineeringWearErosionFoundationCanonicalLaneLean.FractureMechanicsPackage
import HautevilleHouse.MaterialsEngineeringWearErosionFoundationCanonicalLaneLean.WearErosionPackage

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CrystallographyClosed A.object ∧ PhaseDiagramClosed A.object ∧
  ElasticityClosed A.object ∧ FractureMechanicsClosed A.object ∧
  WearErosionClosed A.object

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedMaterialsErosionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_materials_erosion_endgame (A : AdmissibleClass) :
    ConstrainedMaterialsErosionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse
