import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure WearErosionPackage where
  abrasiveParticle : Type u
  surfaceTopography : Type v
  archardWearLaw : Prop
  erosionRateModel : Prop
  particleImpactVelocity : Prop
  impactAngle : Prop
  materialRemovalMechanism : Prop

structure WearErosionEvidence (W : WearErosionPackage) where
  archardWearLawClosed : W.archardWearLaw
  erosionRateModelClosed : W.erosionRateModel
  particleImpactVelocityClosed : W.particleImpactVelocity
  impactAngleClosed : W.impactAngle
  materialRemovalMechanismClosed : W.materialRemovalMechanism

def WearErosionClosed (W : WearErosionPackage) : Prop :=
  W.archardWearLaw ∧ W.erosionRateModel ∧ W.particleImpactVelocity ∧
  W.impactAngle ∧ W.materialRemovalMechanism

theorem wear_erosion_closed_from_evidence (W : WearErosionPackage)
    (E : WearErosionEvidence W) : WearErosionClosed W := by
  exact And.intro E.archardWearLawClosed
    (And.intro E.erosionRateModelClosed
      (And.intro E.particleImpactVelocityClosed
        (And.intro E.impactAngleClosed E.materialRemovalMechanismClosed)))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse
