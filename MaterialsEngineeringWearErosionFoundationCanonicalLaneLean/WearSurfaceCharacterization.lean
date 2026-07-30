import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure WearSurfacePackage where
  surfaceMaterial : Type u
  surfaceTopography : Type v
  loadConditions : Type w
  surfaceHardness : Prop
  asperityGeometry : Prop
  contactPressureDistribution : Prop
  materialDeformationMode : Prop

structure WearSurfaceEvidence (W : WearSurfacePackage) where
  surfaceHardnessClosed : W.surfaceHardness
  asperityGeometryClosed : W.asperityGeometry
  contactPressureDistributionClosed : W.contactPressureDistribution
  materialDeformationModeClosed : W.materialDeformationMode

def WearSurfaceClosed (W : WearSurfacePackage) : Prop :=
  W.surfaceHardness ∧ W.asperityGeometry ∧ W.contactPressureDistribution ∧ W.materialDeformationMode

theorem wear_surface_closed_from_evidence (W : WearSurfacePackage) (E : WearSurfaceEvidence W) :
    WearSurfaceClosed W := by
  exact And.intro E.surfaceHardnessClosed
    (And.intro E.asperityGeometryClosed
      (And.intro E.contactPressureDistributionClosed E.materialDeformationModeClosed))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse