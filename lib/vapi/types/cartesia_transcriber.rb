# frozen_string_literal: true

module Vapi
  module Types
    class CartesiaTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::CartesiaTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::CartesiaTranscriberLanguage }, optional: true, nullable: false
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
