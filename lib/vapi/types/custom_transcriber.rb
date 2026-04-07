# frozen_string_literal: true

module Vapi
  module Types
    class CustomTranscriber < Internal::Types::Model
      field :server, -> { Vapi::Types::Server }, optional: false, nullable: false
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
