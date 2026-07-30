import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean.InferenceMechanism

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure StochasticProcessModelPackage {N : NeuralNetworkPackage}
    {SGD : StochasticGradientDescentPackage N}
    {IM : InferenceMechanismPackage SGD} where
  stateSpace : Type u
  timeIndex : Type v
  transitionKernelDefined : Prop
  markovProperty : Prop
  stationarityCondition : Prop
  ergodicityEnsured : Prop

structure StochasticProcessModelEvidence {N : NeuralNetworkPackage}
    {SGD : StochasticGradientDescentPackage N}
    {IM : InferenceMechanismPackage SGD}
    (SP : StochasticProcessModelPackage IM) where
  transitionKernelDefinedClosed : SP.transitionKernelDefined
  markovPropertyClosed : SP.markovProperty
  stationarityConditionClosed : SP.stationarityCondition
  ergodicityEnsuredClosed : SP.ergodicityEnsured

def StochasticProcessModelClosed {N : NeuralNetworkPackage}
    {SGD : StochasticGradientDescentPackage N}
    {IM : InferenceMechanismPackage SGD}
    (SP : StochasticProcessModelPackage IM) : Prop :=
  SP.transitionKernelDefined ∧ SP.markovProperty ∧
  SP.stationarityCondition ∧ SP.ergodicityEnsured

theorem stochastic_process_model_closed_from_evidence
    {N : NeuralNetworkPackage} {SGD : StochasticGradientDescentPackage N}
    {IM : InferenceMechanismPackage SGD}
    (SP : StochasticProcessModelPackage IM) (E : StochasticProcessModelEvidence SP) :
    StochasticProcessModelClosed SP := by
  exact And.intro E.transitionKernelDefinedClosed
    (And.intro E.markovPropertyClosed
      (And.intro E.stationarityConditionClosed E.ergodicityEnsuredClosed))

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse