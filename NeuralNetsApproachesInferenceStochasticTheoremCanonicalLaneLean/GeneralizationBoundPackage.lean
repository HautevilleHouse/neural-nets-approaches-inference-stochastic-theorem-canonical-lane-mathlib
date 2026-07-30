import NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean.NeuralNetworkInferenceStochasticAdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure GeneralizationBoundPackage (C : NeuralNetworkInferenceContext) where
  trainingSize : ℕ
  hypothesisClassComplexity : ℕ
  lipschitzConstant : ℝ
  marginBound : ℝ
  empiricalRiskMinimizer : Prop
  populationRiskBound : ℝ
  boundHolds : populationRiskBound > 0

structure GeneralizationBoundEvidence {C : NeuralNetworkInferenceContext}
    (P : GeneralizationBoundPackage C) where
  empiricalRiskMinimizerClosed : P.empiricalRiskMinimizer
  boundHoldsClosed : P.boundHolds

def GeneralizationBoundClosed {C : NeuralNetworkInferenceContext}
    (P : GeneralizationBoundPackage C) : Prop :=
  P.empiricalRiskMinimizer ∧ P.boundHolds

theorem generalization_bound_closed_from_evidence
    {C : NeuralNetworkInferenceContext}
    (P : GeneralizationBoundPackage C)
    (E : GeneralizationBoundEvidence P) : GeneralizationBoundClosed P := by
  exact And.intro E.empiricalRiskMinimizerClosed E.boundHoldsClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse