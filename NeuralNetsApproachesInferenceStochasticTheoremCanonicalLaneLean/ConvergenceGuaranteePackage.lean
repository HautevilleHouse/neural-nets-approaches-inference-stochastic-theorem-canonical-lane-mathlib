import NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean.NeuralNetworkInferenceStochasticAdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure ConvergenceGuaranteePackage (C : NeuralNetworkInferenceContext) where
  learningRateSchedule : List ℝ
  iterationCount : ℕ
  lossValues : List ℝ
  limitLoss : ℝ
  gradientNormBound : ℝ
  convergesToGlobalMin : Prop
  convergenceRate : ℝ
  convergenceHolds : convergesToGlobalMin

structure ConvergenceGuaranteeEvidence {C : NeuralNetworkInferenceContext}
    (P : ConvergenceGuaranteePackage C) where
  convergesToGlobalMinClosed : P.convergesToGlobalMin
  convergenceRateClosed : P.convergenceRate > 0

def ConvergenceGuaranteeClosed {C : NeuralNetworkInferenceContext}
    (P : ConvergenceGuaranteePackage C) : Prop :=
  P.convergesToGlobalMin ∧ P.convergenceRate > 0

theorem convergence_guarantee_closed_from_evidence
    {C : NeuralNetworkInferenceContext}
    (P : ConvergenceGuaranteePackage C)
    (E : ConvergenceGuaranteeEvidence P) : ConvergenceGuaranteeClosed P := by
  exact And.intro E.convergesToGlobalMinClosed E.convergenceRateClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse