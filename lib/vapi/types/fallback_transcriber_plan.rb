# frozen_string_literal: true

module Vapi
  module Types
    # Lists backup transcriber configurations that can be used if the primary transcriber fails.
    class FallbackTranscriberPlan < Internal::Types::Model
      field :transcribers, -> { Internal::Types::Array[Vapi::Types::FallbackTranscriberPlanTranscribersItem] }, optional: true, nullable: false
    end
  end
end
