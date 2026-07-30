import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure NeuralNetworkInferencePackage where
  architecture : Type u
  parameters : Type v
  stochasticLayer : Type w
  inferenceNoise : Prop
  outputDistribution : Prop
  convergenceRate : Prop
  lossLandscape : Prop

structure NeuralNetworkInferenceEvidence (P : NeuralNetworkInferencePackage) where
  architectureDefined : P.architecture
  parametersFinite : P.parameters
  stochasticLayerLinear : P.stochasticLayer
  inferenceNoiseBounded : P.inferenceNoise
  outputDistributionValid : P.outputDistribution
  convergenceRateMeasurable : P.convergenceRate
  lossLandscapeConvex : P.lossLandscape

def InferenceClosed (P : NeuralNetworkInferencePackage) : Prop :=
  P.architecture ∧ P.parameters ∧ P.stochasticLayer ∧
  P.inferenceNoise ∧ P.outputDistribution ∧ P.convergenceRate ∧ P.lossLandscape

theorem inference_closed_from_evidence (P : NeuralNetworkInferencePackage)
    (E : NeuralNetworkInferenceEvidence P) : InferenceClosed P := by
  exact And.intro E.architectureDefined (And.intro E.parametersFinite (And.intro E.stochasticLayerLinear
    (And.intro E.inferenceNoiseBounded (And.intro E.outputDistributionValid
      (And.intro E.convergenceRateMeasurable E.lossLandscapeConvex)))))

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse