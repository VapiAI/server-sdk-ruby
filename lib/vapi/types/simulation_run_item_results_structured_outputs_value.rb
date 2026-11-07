# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunItemResultsStructuredOutputsValue < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :result, -> { Object }, optional: false, nullable: true
    end
  end
end
