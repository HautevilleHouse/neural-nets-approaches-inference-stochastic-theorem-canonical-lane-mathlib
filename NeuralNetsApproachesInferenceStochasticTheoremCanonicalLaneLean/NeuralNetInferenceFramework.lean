import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure NeuralNetInferenceFramework where
  neuralNetwork : Type
  activationFunction : String
  layerCount : Nat
  inferenceRule : Prop
  trainingDataAvailable : Prop

structure NeuralNetInferenceEvidence (F : NeuralNetInferenceFramework) where
  inferenceRuleClosed : F.inferenceRule
  trainingDataAvailableClosed : F.trainingDataAvailable

def NeuralNetInferenceFrameworkClosed (F : NeuralNetInferenceFramework) : Prop :=
  F.inferenceRule ∧ F.trainingDataAvailable

theorem neural_net_inference_closed_from_evidence (F : NeuralNetInferenceFramework) (E : NeuralNetInferenceEvidence F) :
    NeuralNetInferenceFrameworkClosed F := by
  exact And.intro E.inferenceRuleClosed E.trainingDataAvailableClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse