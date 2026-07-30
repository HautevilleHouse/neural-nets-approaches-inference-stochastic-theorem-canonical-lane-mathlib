import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure StochasticConvergencePackage where
  stochasticProcess : Type
  convergenceRate : Prop
  stabilityCondition : Prop
  limitingDistribution : Prop

structure StochasticConvergenceEvidence (S : StochasticConvergencePackage) where
  convergenceRateClosed : S.convergenceRate
  stabilityConditionClosed : S.stabilityCondition
  limitingDistributionClosed : S.limitingDistribution

def StochasticConvergenceClosed (S : StochasticConvergencePackage) : Prop :=
  S.convergenceRate ∧ S.stabilityCondition ∧ S.limitingDistribution

theorem stochastic_convergence_closed_from_evidence (S : StochasticConvergencePackage) (E : StochasticConvergenceEvidence S) :
    StochasticConvergenceClosed S := by
  exact And.intro E.convergenceRateClosed (And.intro E.stabilityConditionClosed E.limitingDistributionClosed)

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse