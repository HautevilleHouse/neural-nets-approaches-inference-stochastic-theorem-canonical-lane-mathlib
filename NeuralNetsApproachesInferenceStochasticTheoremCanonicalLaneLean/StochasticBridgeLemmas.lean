import NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean.NeuralNetworkInferenceStochasticAdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let obj : StochasticInferenceObject := A.object
  obj.generalizationBound ∧ obj.convergenceGuarantee

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse