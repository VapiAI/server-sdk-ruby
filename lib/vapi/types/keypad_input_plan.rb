# frozen_string_literal: true

module Vapi
  module Types
    class KeypadInputPlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
      field :delimiters, -> { Vapi::Types::KeypadInputPlanDelimiters }, optional: true, nullable: false
    end
  end
end
