# frozen_string_literal: true

module Vapi
  module Types
    class XaiTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::XaiTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::XaiTranscriberLanguage }, optional: true, nullable: false
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
