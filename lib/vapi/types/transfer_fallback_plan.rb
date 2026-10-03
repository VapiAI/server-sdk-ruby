# frozen_string_literal: true

module Vapi
  module Types
    # Controls the message and end-call behavior used when a call transfer fails.
    class TransferFallbackPlan < Internal::Types::Model
      field :message, -> { Vapi::Types::TransferFallbackPlanMessage }, optional: false, nullable: false
      field :end_call_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "endCallEnabled"
    end
  end
end
