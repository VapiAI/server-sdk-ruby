# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardGoalOptionDto < Internal::Types::Model
      field :goal_id, -> { String }, optional: false, nullable: false, api_name: "goalId"
      field :succeeds_when, -> { String }, optional: false, nullable: false, api_name: "succeedsWhen"
      field :leave_out, -> { String }, optional: true, nullable: false, api_name: "leaveOut"
      field :goal_version, -> { String }, optional: false, nullable: false, api_name: "goalVersion"
    end
  end
end
