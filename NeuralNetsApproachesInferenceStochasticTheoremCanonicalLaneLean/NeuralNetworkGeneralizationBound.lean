import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure NeuralNetworkGeneralizationBound where
  hypothesisSpace : Type u
  sampleComplexity : Type v
  generalizationGap : Type w
  boundDerived : Prop
  capacityControl : Prop
  boundDerivedTerm : boundDerived
  capacityControlTerm : capacityControl

structure NeuralNetworkGeneralizationBoundEvidence (G : NeuralNetworkGeneralizationBound) where
  boundDerivedClosed : G.boundDerived
  capacityControlClosed : G.capacityControl

def NeuralNetworkGeneralizationBoundClosed (G : NeuralNetworkGeneralizationBound) : Prop :=
  G.boundDerived ∧ G.capacityControl

theorem neural_network_generalization_bound_closed_from_evidence
    (G : NeuralNetworkGeneralizationBound) (E : NeuralNetworkGeneralizationBoundEvidence G) :
    NeuralNetworkGeneralizationBoundClosed G := by
  exact And.intro E.boundDerivedClosed E.capacityControlClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse