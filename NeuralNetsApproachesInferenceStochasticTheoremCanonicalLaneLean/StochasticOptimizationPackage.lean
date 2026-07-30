import NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean.NeuralNetworkInferenceStochasticAdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure StochasticOptimizationPackage (C : NeuralNetworkInferenceContext) where
  batchSize : ℕ
  stochasticGradientEstimate : ℝ → ℝ
  noiseDistribution : Prop
  varianceBound : ℝ
  expectedUpdate : Prop
  almostSureConvergence : Prop

structure StochasticOptimizationEvidence {C : NeuralNetworkInferenceContext}
    (P : StochasticOptimizationPackage C) where
  expectedUpdateClosed : P.expectedUpdate
  almostSureConvergenceClosed : P.almostSureConvergence

def StochasticOptimizationClosed {C : NeuralNetworkInferenceContext}
    (P : StochasticOptimizationPackage C) : Prop :=
  P.expectedUpdate ∧ P.almostSureConvergence

theorem stochastic_optimization_closed_from_evidence
    {C : NeuralNetworkInferenceContext}
    (P : StochasticOptimizationPackage C)
    (E : StochasticOptimizationEvidence P) : StochasticOptimizationClosed P := by
  exact And.intro E.expectedUpdateClosed E.almostSureConvergenceClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse