import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure BayesianInferencePackage (P : NeuralNetworkInferencePackage) where
  priorDistribution : Prop
  posteriorComputation : Prop
  evidenceLowerBound : Prop
  mcmcConvergence : Prop
  variationalApproximation : Prop
  uncertaintyQuantification : Prop

structure BayesianInferenceEvidence {P : NeuralNetworkInferencePackage}
    (B : BayesianInferencePackage P) where
  priorSpecified : B.priorDistribution
  posteriorValid : B.posteriorComputation
  evidenceLowerBoundPositive : B.evidenceLowerBound
  mcmcConvergenceStationary : B.mcmcConvergence
  variationalApproximationTight : B.variationalApproximation
  uncertaintyQuantificationMargins : B.uncertaintyQuantification

def BayesianInferenceClosed {P : NeuralNetworkInferencePackage}
    (B : BayesianInferencePackage P) : Prop :=
  B.priorDistribution ∧ B.posteriorComputation ∧ B.evidenceLowerBound ∧
  B.mcmcConvergence ∧ B.variationalApproximation ∧ B.uncertaintyQuantification

theorem bayesian_inference_closed_from_evidence {P : NeuralNetworkInferencePackage}
    (B : BayesianInferencePackage P) (E : BayesianInferenceEvidence B) :
    BayesianInferenceClosed B := by
  exact And.intro E.priorSpecified (And.intro E.posteriorValid (And.intro E.evidenceLowerBoundPositive
    (And.intro E.mcmcConvergenceStationary (And.intro E.variationalApproximationTight
      E.uncertaintyQuantificationMargins))))

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse