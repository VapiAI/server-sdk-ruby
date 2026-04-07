# frozen_string_literal: true

module Vapi
  module Types
    class OpenAiTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::OpenAiTranscriberModel }, optional: false, nullable: false
      field :language, -> { Vapi::Types::OpenAiTranscriberLanguage }, optional: true, nullable: false
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
