# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardAssistantGoalsDto < Internal::Types::Model
      field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
      field :latest_version, -> { String }, optional: true, nullable: false, api_name: "latestVersion"
      field :goals, -> { Internal::Types::Array[Vapi::Types::CallHealthDashboardGoalOptionDto] }, optional: false, nullable: false
    end
  end
end
