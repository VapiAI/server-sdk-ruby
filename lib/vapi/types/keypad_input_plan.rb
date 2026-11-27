# frozen_string_literal: true

module Vapi
  module Types
    # Controls collection of dual-tone multi-frequency (DTMF) keypad input, including enablement, processing timeout,
    # and delimiters.
    class KeypadInputPlan < Internal::Types::Model
      field :variable_name, -> { String }, optional: true, nullable: false, api_name: "variableName"
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
      field :delimiters, -> { Vapi::Types::KeypadInputPlanDelimiters }, optional: true, nullable: false
      field :trigger_response_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "triggerResponseEnabled"
    end
  end
end
