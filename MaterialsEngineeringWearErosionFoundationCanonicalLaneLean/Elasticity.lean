import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionFoundationCanonicalLaneLean

structure ElasticityPackage where
  stressTensorDefined : Prop
  strainTensorDefined : Prop
  constitutiveRelation : Prop
  youngModulus : Prop
  poissonRatio : Prop
  hookesLawValid : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  stressTensorDefinedClosed : E.stressTensorDefined
  strainTensorDefinedClosed : E.strainTensorDefined
  constitutiveRelationClosed : E.constitutiveRelation
  youngModulusClosed : E.youngModulus
  poissonRatioClosed : E.poissonRatio
  hookesLawValidClosed : E.hookesLawValid

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.stressTensorDefined ∧ E.strainTensorDefined ∧ E.constitutiveRelation ∧
  E.youngModulus ∧ E.poissonRatio ∧ E.hookesLawValid

theorem elasticity_closed_from_evidence (E : ElasticityPackage)
    (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.stressTensorDefinedClosed
    (And.intro Ev.strainTensorDefinedClosed
      (And.intro Ev.constitutiveRelationClosed
        (And.intro Ev.youngModulusClosed
          (And.intro Ev.poissonRatioClosed Ev.hookesLawValidClosed))))

end MaterialsEngineeringWearErosionFoundationCanonicalLaneLean
end HautevilleHouse
