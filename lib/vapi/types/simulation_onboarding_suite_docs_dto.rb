# frozen_string_literal: true

module Vapi
  module Types
    class SimulationOnboardingSuiteDocsDto < Internal::Types::Model
      field :best_practices, -> { String }, optional: false, nullable: false, api_name: "bestPractices"
      field :tool_mocks, -> { String }, optional: false, nullable: false, api_name: "toolMocks"
    end
  end
end
