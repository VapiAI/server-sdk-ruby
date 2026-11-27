# frozen_string_literal: true

module Vapi
  module Types
    class AssistantGoalSetDto < Internal::Types::Model
      field :expected_goal_version, -> { String }, optional: false, nullable: false, api_name: "expectedGoalVersion"
      field :succeeds_when, -> { String }, optional: false, nullable: false, api_name: "succeedsWhen"
      field :leave_out, -> { String }, optional: true, nullable: false, api_name: "leaveOut"
    end
  end
end
