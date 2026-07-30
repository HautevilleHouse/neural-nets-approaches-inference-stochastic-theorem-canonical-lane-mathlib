import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure StochasticGradientFlow where
  parameterSpace : Type u
  lossFunction : Type v
  gradientEstimator : Type w
  learningRateSchedule : Type x
  flowDefined : Prop
  stochasticGradientUnbiased : Prop
  flowDefinedTerm : flowDefined
  stochasticGradientUnbiasedTerm : stochasticGradientUnbiased

structure StochasticGradientFlowEvidence (G : StochasticGradientFlow) where
  flowDefinedClosed : G.flowDefined
  stochasticGradientUnbiasedClosed : G.stochasticGradientUnbiased

def StochasticGradientFlowClosed (G : StochasticGradientFlow) : Prop :=
  G.flowDefined ∧ G.stochasticGradientUnbiased

theorem stochastic_gradient_flow_closed_from_evidence (G : StochasticGradientFlow)
    (E : StochasticGradientFlowEvidence G) : StochasticGradientFlowClosed G := by
  exact And.intro E.flowDefinedClosed E.stochasticGradientUnbiasedClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse