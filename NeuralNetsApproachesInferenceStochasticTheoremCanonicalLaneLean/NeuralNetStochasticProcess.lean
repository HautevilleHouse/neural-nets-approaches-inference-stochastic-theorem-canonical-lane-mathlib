import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure NeuralStochasticProcess where
  processType : Type u
  stateSpace : Type v
  timeDomain : Type w
  filtration : Prop
  transitionKernel : Prop
  markovProperty : Prop
  samplePathRegularity : Prop
  filtrationTerm : filtration
  transitionKernelTerm : transitionKernel
  markovPropertyTerm : markovProperty
  samplePathRegularityTerm : samplePathRegularity

structure NeuralStochasticProcessEvidence (N : NeuralStochasticProcess) where
  filtrationClosed : N.filtration
  transitionKernelClosed : N.transitionKernel
  markovPropertyClosed : N.markovProperty
  samplePathRegularityClosed : N.samplePathRegularity

def NeuralStochasticProcessClosed (N : NeuralStochasticProcess) : Prop :=
  N.filtration ∧ N.transitionKernel ∧ N.markovProperty ∧ N.samplePathRegularity

theorem neural_stochastic_process_closed_from_evidence
    (N : NeuralStochasticProcess) (E : NeuralStochasticProcessEvidence N) :
    NeuralStochasticProcessClosed N := by
  exact And.intro E.filtrationClosed
    (And.intro E.transitionKernelClosed
      (And.intro E.markovPropertyClosed E.samplePathRegularityClosed))

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse