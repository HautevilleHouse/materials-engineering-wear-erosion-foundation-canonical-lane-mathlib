import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

def WearErosionWitnessClosed (O : WearErosionAdmittedObject) : Prop :=
  O.erosionMechanism

def bridgeClosed (A : AdmissibleClass) : Prop :=
  WearErosionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse