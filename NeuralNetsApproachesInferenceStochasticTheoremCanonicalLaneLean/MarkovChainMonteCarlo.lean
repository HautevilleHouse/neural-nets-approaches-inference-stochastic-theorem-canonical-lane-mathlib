import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure MarkovChainMonteCarlo where
  proposalDistribution : Type
  acceptanceCriterion : Prop
  chainMixing : Prop
  stationaryDistributionReached : Prop

structure MarkovChainMonteCarloEvidence (M : MarkovChainMonteCarlo) where
  acceptanceCriterionClosed : M.acceptanceCriterion
  chainMixingClosed : M.chainMixing
  stationaryDistributionReachedClosed : M.stationaryDistributionReached

def MarkovChainMonteCarloClosed (M : MarkovChainMonteCarlo) : Prop :=
  M.acceptanceCriterion ∧ M.chainMixing ∧ M.stationaryDistributionReached

theorem markov_chain_monte_carlo_closed_from_evidence (M : MarkovChainMonteCarlo) (E : MarkovChainMonteCarloEvidence M) :
    MarkovChainMonteCarloClosed M := by
  exact And.intro E.acceptanceCriterionClosed (And.intro E.chainMixingClosed E.stationaryDistributionReachedClosed)

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse