import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsEngineeringWearErosionFoundationCanonicalLaneLean.ErosionCorrosionInteraction

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure WearTestStandardPackage where
  testMethod : Prop
  specimenGeometry : Prop
  loadingProtocol : Prop
  environmentalControl : Prop
  measurementUncertainty : Prop
  dataReporting : Prop

structure WearTestStandardEvidence (S : WearTestStandardPackage) where
  testMethodClosed : S.testMethod
  specimenGeometryClosed : S.specimenGeometry
  loadingProtocolClosed : S.loadingProtocol
  environmentalControlClosed : S.environmentalControl
  measurementUncertaintyClosed : S.measurementUncertainty
  dataReportingClosed : S.dataReporting

def WearTestStandardClosed (S : WearTestStandardPackage) : Prop :=
  S.testMethod ∧ S.specimenGeometry ∧ S.loadingProtocol ∧
  S.environmentalControl ∧ S.measurementUncertainty ∧ S.dataReporting

theorem wear_test_standard_closed_from_evidence (S : WearTestStandardPackage)
    (E : WearTestStandardEvidence S) : WearTestStandardClosed S := by
  exact And.intro E.testMethodClosed
    (And.intro E.specimenGeometryClosed
      (And.intro E.loadingProtocolClosed
        (And.intro E.environmentalControlClosed
          (And.intro E.measurementUncertaintyClosed E.dataReportingClosed))))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse