import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsEngineeringWearErosionFoundationCanonicalLaneLean.WearSurfaceCharacterization

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure ErosionCorrosionPackage {W : WearSurfacePackage} where
  electrochemicalKinetics : Prop
  passivationFilmStability : Prop
  erosionEnhancedCorrosion : Prop
  corrosionEnhancedErosion : Prop
  synergisticEffect : Prop
  totalMaterialLoss : Prop

structure ErosionCorrosionEvidence {W : WearSurfacePackage} (E : ErosionCorrosionPackage W) where
  electrochemicalKineticsClosed : E.electrochemicalKinetics
  passivationFilmStabilityClosed : E.passivationFilmStability
  erosionEnhancedCorrosionClosed : E.erosionEnhancedCorrosion
  corrosionEnhancedErosionClosed : E.corrosionEnhancedErosion
  synergisticEffectClosed : E.synergisticEffect
  totalMaterialLossClosed : E.totalMaterialLoss

def ErosionCorrosionClosed {W : WearSurfacePackage} (E : ErosionCorrosionPackage W) : Prop :=
  E.electrochemicalKinetics ∧ E.passivationFilmStability ∧ E.erosionEnhancedCorrosion ∧
  E.corrosionEnhancedErosion ∧ E.synergisticEffect ∧ E.totalMaterialLoss

theorem erosion_corrosion_closed_from_evidence {W : WearSurfacePackage} (E : ErosionCorrosionPackage W)
    (Ev : ErosionCorrosionEvidence E) : ErosionCorrosionClosed E := by
  exact And.intro Ev.electrochemicalKineticsClosed
    (And.intro Ev.passivationFilmStabilityClosed
      (And.intro Ev.erosionEnhancedCorrosionClosed
        (And.intro Ev.corrosionEnhancedErosionClosed
          (And.intro Ev.synergisticEffectClosed Ev.totalMaterialLossClosed))))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse