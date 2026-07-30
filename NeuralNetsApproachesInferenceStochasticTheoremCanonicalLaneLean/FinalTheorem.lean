import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure NeuralNetAdmittedObject where
  inferencePackage : NeuralNetworkInferencePackage
  noisePackage : NoiseClassificationPackage inferencePackage
  bayesianPackage : BayesianInferencePackage inferencePackage
  inferenceClosed : InferenceClosed inferencePackage
  noiseClosed : NoiseClassificationClosed noisePackage
  bayesianClosed : BayesianInferenceClosed bayesianPackage

def NeuralNetAdmissibleClass : AdmissibleClass := {
  object := NeuralNetAdmittedObject
  endpointSatisfied := InferenceClosed
  remainderRecorded := NoiseClassificationClosed ∧ BayesianInferenceClosed
  gateWitness := Or.inl (by exact ?_)
}

def ConstrainedNeuralNetClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem neural_net_admissible_endgame (A : AdmissibleClass) :
    ConstrainedNeuralNetClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse