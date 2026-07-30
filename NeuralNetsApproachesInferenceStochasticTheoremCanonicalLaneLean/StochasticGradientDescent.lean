import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure StochasticGradientDescent where
  learningRateSchedule : Type u
  batchSamplingProcedure : Type v
  convergenceGuarantee : Prop
  asymptoticVarianceControlled : Prop
  convergenceGuaranteeTerm : convergenceGuarantee
  asymptoticVarianceControlledTerm : asymptoticVarianceControlled

structure StochasticGradientDescentEvidence (SGD : StochasticGradientDescent) where
  convergenceGuaranteeClosed : SGD.convergenceGuarantee
  asymptoticVarianceControlledClosed : SGD.asymptoticVarianceControlled

def StochasticGradientDescentClosed (SGD : StochasticGradientDescent) : Prop :=
  SGD.convergenceGuarantee ∧ SGD.asymptoticVarianceControlled

theorem stochastic_gradient_descent_closed_from_evidence
    (SGD : StochasticGradientDescent) (E : StochasticGradientDescentEvidence SGD) :
    StochasticGradientDescentClosed SGD := by
  exact And.intro E.convergenceGuaranteeClosed E.asymptoticVarianceControlledClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse