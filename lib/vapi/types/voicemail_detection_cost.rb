# frozen_string_literal: true

module Vapi
  module Types
    class VoicemailDetectionCost < Internal::Types::Model
      field :model, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :provider, -> { Vapi::Types::VoicemailDetectionCostProvider }, optional: false, nullable: false
      field :prompt_text_tokens, -> { Integer }, optional: false, nullable: false, api_name: "promptTextTokens"
      field :prompt_audio_tokens, -> { Integer }, optional: false, nullable: false, api_name: "promptAudioTokens"
      field :completion_text_tokens, -> { Integer }, optional: false, nullable: false, api_name: "completionTextTokens"
      field :completion_audio_tokens, -> { Integer }, optional: false, nullable: false, api_name: "completionAudioTokens"
      field :cost, -> { Integer }, optional: false, nullable: false
    end
  end
end
