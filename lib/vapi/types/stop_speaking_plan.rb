# frozen_string_literal: true

module Vapi
  module Types
    class StopSpeakingPlan < Internal::Types::Model
      field :num_words, -> { Integer }, optional: true, nullable: false, api_name: "numWords"
      field :voice_seconds, -> { Integer }, optional: true, nullable: false, api_name: "voiceSeconds"
      field :backoff_seconds, -> { Integer }, optional: true, nullable: false, api_name: "backoffSeconds"
      field :acknowledgement_phrases, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "acknowledgementPhrases"
      field :interruption_phrases, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "interruptionPhrases"
    end
  end
end
