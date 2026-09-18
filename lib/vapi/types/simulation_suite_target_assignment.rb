# frozen_string_literal: true

module Vapi
  module Types
    class SimulationSuiteTargetAssignment < Internal::Types::Model
      field :target_type, -> { Vapi::Types::SimulationSuiteTargetAssignmentTargetType }, optional: false, nullable: false, api_name: "targetType"
      field :target_id, -> { String }, optional: false, nullable: false, api_name: "targetId"
    end
  end
end
