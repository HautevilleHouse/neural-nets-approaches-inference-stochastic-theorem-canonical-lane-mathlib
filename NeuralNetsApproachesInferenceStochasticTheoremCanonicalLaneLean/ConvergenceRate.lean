import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean.StochasticProcessModel

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure ConvergenceRatePackage {N : NeuralNetworkPackage}
    {SGD : StochasticGradientDescentPackage N}
    {IM : InferenceMechanismPackage SGD}
    {SP : StochasticProcessModelPackage IM} where
  convergenceRateType : String
  upperBound : ℝ
  lowerBound : ℝ
  rateDerived : Prop
  asymptoticBehaviorCharacterized : Prop

structure ConvergenceRateEvidence {N : NeuralNetworkPackage}
    {SGD : StochasticGradientDescentPackage N}
    {IM : InferenceMechanismPackage SGD}
    {SP : StochasticProcessModelPackage IM}
    (CR : ConvergenceRatePackage SP) where
  rateDerivedClosed : CR.rateDerived
  asymptoticBehaviorCharacterizedClosed : CR.asymptoticBehaviorCharacterized

def ConvergenceRateClosed {N : NeuralNetworkPackage}
    {SGD : StochasticGradientDescentPackage N}
    {IM : InferenceMechanismPackage SGD}
    {SP : StochasticProcessModelPackage IM}
    (CR : ConvergenceRatePackage SP) : Prop :=
  CR.rateDerived ∧ CR.asymptoticBehaviorCharacterized

theorem convergence_rate_closed_from_evidence
    {N : NeuralNetworkPackage} {SGD : StochasticGradientDescentPackage N}
    {IM : InferenceMechanismPackage SGD} {SP : StochasticProcessModelPackage IM}
    (CR : ConvergenceRatePackage SP) (E : ConvergenceRateEvidence CR) :
    ConvergenceRateClosed CR := by
  exact And.intro E.rateDerivedClosed E.asymptoticBehaviorCharacterizedClosed

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse