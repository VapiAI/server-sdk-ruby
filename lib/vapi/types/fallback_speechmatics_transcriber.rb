# frozen_string_literal: true

module Vapi
  module Types
    class FallbackSpeechmaticsTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackSpeechmaticsTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackSpeechmaticsTranscriberLanguage }, optional: true, nullable: false
      field :operating_point, -> { Vapi::Types::FallbackSpeechmaticsTranscriberOperatingPoint }, optional: true, nullable: false, api_name: "operatingPoint"
      field :region, -> { Vapi::Types::FallbackSpeechmaticsTranscriberRegion }, optional: true, nullable: false
      field :enable_diarization, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "enableDiarization"
      field :max_delay, -> { Integer }, optional: true, nullable: false, api_name: "maxDelay"
      field :custom_vocabulary, -> { Internal::Types::Array[Vapi::Types::SpeechmaticsCustomVocabularyItem] }, optional: false, nullable: false, api_name: "customVocabulary"
      field :numeral_style, -> { Vapi::Types::FallbackSpeechmaticsTranscriberNumeralStyle }, optional: true, nullable: false, api_name: "numeralStyle"
      field :end_of_turn_sensitivity, -> { Integer }, optional: true, nullable: false, api_name: "endOfTurnSensitivity"
      field :remove_disfluencies, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "removeDisfluencies"
      field :minimum_speech_duration, -> { Integer }, optional: true, nullable: false, api_name: "minimumSpeechDuration"
    end
  end
end
