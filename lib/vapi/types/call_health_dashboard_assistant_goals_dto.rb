# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardAssistantGoalsDto < Internal::Types::Model
      field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
      field :goals, -> { Internal::Types::Array[Vapi::Types::CallHealthDashboardGoalOptionDto] }, optional: false, nullable: false
    end
  end
end
