import NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NeuralNetWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse