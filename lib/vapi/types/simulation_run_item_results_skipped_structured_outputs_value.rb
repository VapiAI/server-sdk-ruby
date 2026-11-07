# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunItemResultsSkippedStructuredOutputsValue < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :unmet_condition, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "unmetCondition"
      field :reason, -> { Vapi::Types::SimulationRunItemResultsSkippedStructuredOutputsValueReason }, optional: true, nullable: false
    end
  end
end
