import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure StochasticConvergenceTheorem where
  trainingProcedure : Type u
  convergenceMetric : Type v
  convergenceRate : Type w
  limitPoint : Type x
  procedureConverges : Prop
  convergenceRateBound : Prop
  procedureConvergesTerm : procedureConverges
  convergenceRateBoundTerm : convergenceRateBound

structure StochasticConvergenceTheoremEvidence (C : StochasticConvergenceTheorem) where
  procedureConvergesClosed : C.procedureConverges
  convergenceRateBoundClosed : C.convergenceRateBound

def StochasticConvergenceTheoremClosed (C : StochasticConvergenceTheorem) : Prop :=
  C.procedureConverges ∧ C.convergenceRateBound

theorem stochastic_convergence_theorem_closed_from_evidence (C : StochasticConvergenceTheorem)
    (E : StochasticConvergenceTheoremEvidence C) : StochasticConvergenceTheoremClosed C := by
  exact And.intro E.procedureConvergesClosed E.convergenceRateBoundClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse