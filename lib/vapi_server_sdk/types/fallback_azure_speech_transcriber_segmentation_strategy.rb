# frozen_string_literal: true

module Vapi
  # Controls how phrase boundaries are detected, enabling either simple time/silence
  #  heuristics or more advanced semantic segmentation.
  class FallbackAzureSpeechTranscriberSegmentationStrategy
    DEFAULT = "Default"
    TIME = "Time"
    SEMANTIC = "Semantic"
  end
end
