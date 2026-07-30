import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure NeuralNetworkArchitecture where
  layerCount : Nat
  activationFunction : Type u
  weightSpace : Type v
  biasSpace : Type w
  forwardPassDefined : Prop
  backpropagationDefined : Prop
  forwardPassDefinedTerm : forwardPassDefined
  backpropagationDefinedTerm : backpropagationDefined

structure NeuralNetworkArchitectureEvidence (A : NeuralNetworkArchitecture) where
  forwardPassDefinedClosed : A.forwardPassDefined
  backpropagationDefinedClosed : A.backpropagationDefined

def NeuralNetworkArchitectureClosed (A : NeuralNetworkArchitecture) : Prop :=
  A.forwardPassDefined ∧ A.backpropagationDefined

theorem neural_network_architecture_closed_from_evidence
    (A : NeuralNetworkArchitecture) (E : NeuralNetworkArchitectureEvidence A) :
    NeuralNetworkArchitectureClosed A := by
  exact And.intro E.forwardPassDefinedClosed E.backpropagationDefinedClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse