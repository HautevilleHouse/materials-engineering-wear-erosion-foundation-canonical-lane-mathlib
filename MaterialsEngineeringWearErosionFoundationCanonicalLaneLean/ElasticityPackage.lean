import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure ElasticityPackage where
  stressTensor : Type u
  strainTensor : Type v
  constitutiveLaw : Prop
  youngModulus : Prop
  poissonRatio : Prop
  yieldCriterion : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  constitutiveLawClosed : E.constitutiveLaw
  youngModulusClosed : E.youngModulus
  poissonRatioClosed : E.poissonRatio
  yieldCriterionClosed : E.yieldCriterion

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.constitutiveLaw ∧ E.youngModulus ∧ E.poissonRatio ∧ E.yieldCriterion

theorem elasticity_closed_from_evidence (E : ElasticityPackage)
    (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.constitutiveLawClosed
    (And.intro Ev.youngModulusClosed
      (And.intro Ev.poissonRatioClosed Ev.yieldCriterionClosed))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse
