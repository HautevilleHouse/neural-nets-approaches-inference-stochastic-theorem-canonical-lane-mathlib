import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure NeuralNetworkInferenceContext where
  architecture : String
  activation : String
  lossFunction : String
  optimizer : String
  trainingData : Type
  trainedWeights : Type

structure StochasticInferenceObject where
  context : NeuralNetworkInferenceContext
  inputDistribution : Prop
  outputDistribution : Prop
  generalizationBound : Prop
  convergenceGuarantee : Prop
  conclusion : generalizationBound ∧ convergenceGuarantee

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse