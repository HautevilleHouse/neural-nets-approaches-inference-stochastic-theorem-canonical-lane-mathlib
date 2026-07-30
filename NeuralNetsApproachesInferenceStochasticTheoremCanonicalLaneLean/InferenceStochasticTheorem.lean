import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure InferenceStochasticTheorem where
  hypothesisSpace : Type u
  lossFunction : Type v
  generalizationBound : Prop
  posteriorConcentration : Prop
  bayesRiskConsistency : Prop
  generalizationBoundTerm : generalizationBound
  posteriorConcentrationTerm : posteriorConcentration
  bayesRiskConsistencyTerm : bayesRiskConsistency

structure InferenceStochasticTheoremEvidence (T : InferenceStochasticTheorem) where
  generalizationBoundClosed : T.generalizationBound
  posteriorConcentrationClosed : T.posteriorConcentration
  bayesRiskConsistencyClosed : T.bayesRiskConsistency

def InferenceStochasticTheoremClosed (T : InferenceStochasticTheorem) : Prop :=
  T.generalizationBound ∧ T.posteriorConcentration ∧ T.bayesRiskConsistency

theorem inference_stochastic_theorem_closed_from_evidence
    (T : InferenceStochasticTheorem) (E : InferenceStochasticTheoremEvidence T) :
    InferenceStochasticTheoremClosed T := by
  exact And.intro E.generalizationBoundClosed
    (And.intro E.posteriorConcentrationClosed E.bayesRiskConsistencyClosed)

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse