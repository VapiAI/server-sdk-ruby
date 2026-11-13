# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardGoalDefinitionDto < Internal::Types::Model
      field :goal_id, -> { String }, optional: false, nullable: false, api_name: "goalId"
      field :succeeds_when, -> { String }, optional: false, nullable: false, api_name: "succeedsWhen"
      field :leave_out, -> { String }, optional: true, nullable: false, api_name: "leaveOut"
    end
  end
end
