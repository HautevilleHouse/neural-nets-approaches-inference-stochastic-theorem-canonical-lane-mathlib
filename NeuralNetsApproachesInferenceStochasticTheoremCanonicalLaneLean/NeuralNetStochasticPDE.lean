import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure NeuralNetStochasticPDE where
  pdeOperator : Type u
  noiseModel : Type v
  neuralNetParametrization : Type w
  solutionExistence : Prop
  uniquenessInLaw : Prop
  regularityPropagation : Prop
  solutionExistenceTerm : solutionExistence
  uniquenessInLawTerm : uniquenessInLaw
  regularityPropagationTerm : regularityPropagation

structure NeuralNetStochasticPDEEvidence (P : NeuralNetStochasticPDE) where
  solutionExistenceClosed : P.solutionExistence
  uniquenessInLawClosed : P.uniquenessInLaw
  regularityPropagationClosed : P.regularityPropagation

def NeuralNetStochasticPDEClosed (P : NeuralNetStochasticPDE) : Prop :=
  P.solutionExistence ∧ P.uniquenessInLaw ∧ P.regularityPropagation

theorem neural_net_stochastic_pde_closed_from_evidence
    (P : NeuralNetStochasticPDE) (E : NeuralNetStochasticPDEEvidence P) :
    NeuralNetStochasticPDEClosed P := by
  exact And.intro E.solutionExistenceClosed
    (And.intro E.uniquenessInLawClosed E.regularityPropagationClosed)

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse