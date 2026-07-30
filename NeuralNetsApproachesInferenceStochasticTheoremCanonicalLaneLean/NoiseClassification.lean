import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean

structure NoiseClassificationPackage (P : NeuralNetworkInferencePackage) where
  whiteNoiseBand : Prop
  adversarialNoise : Prop
  labelNoise : Prop
  noiseRobustnessInequality : Prop

structure NoiseClassificationEvidence {P : NeuralNetworkInferencePackage}
    (N : NoiseClassificationPackage P) where
  whiteNoiseBandBounded : N.whiteNoiseBand
  adversarialNoiseControlled : N.adversarialNoise
  labelNoiseStochastic : N.labelNoise
  noiseRobustnessInequalityProved : N.noiseRobustnessInequality

def NoiseClassificationClosed {P : NeuralNetworkInferencePackage}
    (N : NoiseClassificationPackage P) : Prop :=
  N.whiteNoiseBand ∧ N.adversarialNoise ∧ N.labelNoise ∧ N.noiseRobustnessInequality

theorem noise_classification_closed_from_evidence {P : NeuralNetworkInferencePackage}
    (N : NoiseClassificationPackage P) (E : NoiseClassificationEvidence N) :
    NoiseClassificationClosed N := by
  exact And.intro E.whiteNoiseBandBounded (And.intro E.adversarialNoiseControlled
    (And.intro E.labelNoiseStochastic E.noiseRobustnessInequalityProved))

end NeuralNetsApproachesInferenceStochasticTheoremCanonicalLaneLean
end HautevilleHouse