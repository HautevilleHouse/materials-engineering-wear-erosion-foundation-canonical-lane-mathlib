import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure ArchardEquationPackage where
  wearVolume : Prop
  normalLoad : Prop
  slidingDistance : Prop
  hardness : Prop
  wearCoefficient : Prop
  archardLaw : Prop

structure ArchardEquationEvidence (A : ArchardEquationPackage) where
  wearVolumeClosed : A.wearVolume
  normalLoadClosed : A.normalLoad
  slidingDistanceClosed : A.slidingDistance
  hardnessClosed : A.hardness
  wearCoefficientClosed : A.wearCoefficient
  archardLawClosed : A.archardLaw

def ArchardEquationClosed (A : ArchardEquationPackage) : Prop :=
  A.wearVolume ∧ A.normalLoad ∧ A.slidingDistance ∧
  A.hardness ∧ A.wearCoefficient ∧ A.archardLaw

theorem archard_equation_closed_from_evidence (A : ArchardEquationPackage)
    (E : ArchardEquationEvidence A) : ArchardEquationClosed A := by
  exact And.intro E.wearVolumeClosed
    (And.intro E.normalLoadClosed
      (And.intro E.slidingDistanceClosed
        (And.intro E.hardnessClosed
          (And.intro E.wearCoefficientClosed E.archardLawClosed))))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse
