# frozen_string_literal: true

module Vapi
  module Types
    # Per-call overrides for values used in workflow template variables.
    class WorkflowOverrides < Internal::Types::Model
      field :variable_values, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "variableValues"
    end
  end
end
