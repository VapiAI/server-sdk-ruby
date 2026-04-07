# frozen_string_literal: true

module Vapi
  module Types
    class AzureSpeechTranscriber < Internal::Types::Model
      field :language, -> { Vapi::Types::AzureSpeechTranscriberLanguage }, optional: true, nullable: false
      field :segmentation_strategy, -> { Vapi::Types::AzureSpeechTranscriberSegmentationStrategy }, optional: true, nullable: false, api_name: "segmentationStrategy"
      field :segmentation_silence_timeout_ms, -> { Integer }, optional: true, nullable: false, api_name: "segmentationSilenceTimeoutMs"
      field :segmentation_maximum_time_ms, -> { Integer }, optional: true, nullable: false, api_name: "segmentationMaximumTimeMs"
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
