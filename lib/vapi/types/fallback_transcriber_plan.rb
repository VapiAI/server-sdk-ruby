# frozen_string_literal: true

module Vapi
  module Types
    class FallbackTranscriberPlan < Internal::Types::Model
      field :transcribers, -> { Internal::Types::Array[Vapi::Types::FallbackTranscriberPlanTranscribersItem] }, optional: false, nullable: false
    end
  end
end
