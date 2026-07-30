import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure BayesianInferenceLayer where
  priorDistribution : Type u
  likelihoodModel : Type v
  posteriorApproximation : Type w
  inferenceWellPosed : Prop
  posteriorConsistent : Prop
  inferenceWellPosedTerm : inferenceWellPosed
  posteriorConsistentTerm : posteriorConsistent

structure BayesianInferenceLayerEvidence (B : BayesianInferenceLayer) where
  inferenceWellPosedClosed : B.inferenceWellPosed
  posteriorConsistentClosed : B.posteriorConsistent

def BayesianInferenceLayerClosed (B : BayesianInferenceLayer) : Prop :=
  B.inferenceWellPosed ∧ B.posteriorConsistent

theorem bayesian_inference_layer_closed_from_evidence (B : BayesianInferenceLayer)
    (E : BayesianInferenceLayerEvidence B) : BayesianInferenceLayerClosed B := by
  exact And.intro E.inferenceWellPosedClosed E.posteriorConsistentClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse