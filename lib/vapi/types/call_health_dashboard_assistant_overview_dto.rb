# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardAssistantOverviewDto < Internal::Types::Model
      field :assistant, -> { Vapi::Types::CallHealthDashboardAssistantReferenceDto }, optional: false, nullable: false
      field :goal_definition, -> { Vapi::Types::CallHealthDashboardGoalDefinitionDto }, optional: false, nullable: false, api_name: "goalDefinition"
      field :goal, -> { Vapi::Types::CallHealthDashboardGoalSummaryDto }, optional: false, nullable: false
    end
  end
end
