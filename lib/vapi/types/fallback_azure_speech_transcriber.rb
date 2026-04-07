# frozen_string_literal: true

module Vapi
  module Types
    class FallbackAzureSpeechTranscriber < Internal::Types::Model
      field :language, -> { Vapi::Types::FallbackAzureSpeechTranscriberLanguage }, optional: true, nullable: false
      field :segmentation_strategy, -> { Vapi::Types::FallbackAzureSpeechTranscriberSegmentationStrategy }, optional: true, nullable: false, api_name: "segmentationStrategy"
      field :segmentation_silence_timeout_ms, -> { Integer }, optional: true, nullable: false, api_name: "segmentationSilenceTimeoutMs"
      field :segmentation_maximum_time_ms, -> { Integer }, optional: true, nullable: false, api_name: "segmentationMaximumTimeMs"
    end
  end
end
