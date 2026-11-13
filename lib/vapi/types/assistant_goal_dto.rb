# frozen_string_literal: true

module Vapi
  module Types
    class AssistantGoalDto < Internal::Types::Model
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
      field :goal_id, -> { String }, optional: false, nullable: false, api_name: "goalId"
      field :goal_version, -> { String }, optional: false, nullable: false, api_name: "goalVersion"
      field :succeeds_when, -> { String }, optional: false, nullable: false, api_name: "succeedsWhen"
      field :leave_out, -> { String }, optional: true, nullable: false, api_name: "leaveOut"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
