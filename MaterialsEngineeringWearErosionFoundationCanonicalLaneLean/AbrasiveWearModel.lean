import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsEngineeringWearErosionFoundationCanonicalLaneLean.WearSurfaceCharacterization

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure AbrasiveWearPackage {W : WearSurfacePackage} where
  abrasiveParticleGeometry : Prop
  particleHardnessRatio : Prop
  wearRateEquation : Prop
  ploughingMechanism : Prop
  cuttingMechanism : Prop
  fragmentationMechanism : Prop

structure AbrasiveWearEvidence {W : WearSurfacePackage} (A : AbrasiveWearPackage W) where
  abrasiveParticleGeometryClosed : A.abrasiveParticleGeometry
  particleHardnessRatioClosed : A.particleHardnessRatio
  wearRateEquationClosed : A.wearRateEquation
  ploughingMechanismClosed : A.ploughingMechanism
  cuttingMechanismClosed : A.cuttingMechanism
  fragmentationMechanismClosed : A.fragmentationMechanism

def AbrasiveWearClosed {W : WearSurfacePackage} (A : AbrasiveWearPackage W) : Prop :=
  A.abrasiveParticleGeometry ∧ A.particleHardnessRatio ∧ A.wearRateEquation ∧
  A.ploughingMechanism ∧ A.cuttingMechanism ∧ A.fragmentationMechanism

theorem abrasive_wear_closed_from_evidence {W : WearSurfacePackage} (A : AbrasiveWearPackage W)
    (E : AbrasiveWearEvidence A) : AbrasiveWearClosed A := by
  exact And.intro E.abrasiveParticleGeometryClosed
    (And.intro E.particleHardnessRatioClosed
      (And.intro E.wearRateEquationClosed
        (And.intro E.ploughingMechanismClosed
          (And.intro E.cuttingMechanismClosed E.fragmentationMechanismClosed))))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse