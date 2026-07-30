import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean.StochasticGradientDescent

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure InferenceMechanismPackage {N : NeuralNetworkPackage}
    {SGD : StochasticGradientDescentPackage N} where
  inputDistribution : Type u
  outputSpace : Type v
  inferenceRuleDefined : Prop
  generalizationBound : Prop
  uncertaintyQuantification : Prop

structure InferenceMechanismEvidence {N : NeuralNetworkPackage}
    {SGD : StochasticGradientDescentPackage N} (IM : InferenceMechanismPackage SGD) where
  inferenceRuleDefinedClosed : IM.inferenceRuleDefined
  generalizationBoundClosed : IM.generalizationBound
  uncertaintyQuantificationClosed : IM.uncertaintyQuantification

def InferenceMechanismClosed {N : NeuralNetworkPackage}
    {SGD : StochasticGradientDescentPackage N} (IM : InferenceMechanismPackage SGD) : Prop :=
  IM.inferenceRuleDefined ∧ IM.generalizationBound ∧ IM.uncertaintyQuantification

theorem inference_mechanism_closed_from_evidence
    {N : NeuralNetworkPackage} {SGD : StochasticGradientDescentPackage N}
    (IM : InferenceMechanismPackage SGD) (E : InferenceMechanismEvidence IM) :
    InferenceMechanismClosed IM := by
  exact And.intro E.inferenceRuleDefinedClosed
    (And.intro E.generalizationBoundClosed E.uncertaintyQuantificationClosed)

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse