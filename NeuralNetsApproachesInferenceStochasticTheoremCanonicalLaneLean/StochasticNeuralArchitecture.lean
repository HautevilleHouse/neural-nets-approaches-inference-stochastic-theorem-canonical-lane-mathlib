import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure StochasticNeuralArchitecture where
  layerType : Type u
  activation : Type v
  weightDistribution : Type w
  forwardPass : Type x
  architectureWellDefined : Prop
  stochasticLayerSampling : Prop
  architectureWellDefinedTerm : architectureWellDefined
  stochasticLayerSamplingTerm : stochasticLayerSampling

structure StochasticNeuralArchitectureEvidence (A : StochasticNeuralArchitecture) where
  architectureWellDefinedClosed : A.architectureWellDefined
  stochasticLayerSamplingClosed : A.stochasticLayerSampling

def StochasticNeuralArchitectureClosed (A : StochasticNeuralArchitecture) : Prop :=
  A.architectureWellDefined ∧ A.stochasticLayerSampling

theorem stochastic_neural_architecture_closed_from_evidence (A : StochasticNeuralArchitecture)
    (E : StochasticNeuralArchitectureEvidence A) : StochasticNeuralArchitectureClosed A := by
  exact And.intro E.architectureWellDefinedClosed E.stochasticLayerSamplingClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse