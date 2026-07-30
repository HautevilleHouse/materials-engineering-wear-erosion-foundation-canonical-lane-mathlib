import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure WearErosionAdmittedObject where
  materialSurface : Type
  surfaceTopology : TopologicalSpace materialSurface
  particleImpact : Prop
  erosionMechanism : Prop
  conclusion : erosionMechanism

structure AdmissibleClass where
  object : WearErosionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  WearErosionWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse