import NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : NeuralNetAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NeuralNetWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse