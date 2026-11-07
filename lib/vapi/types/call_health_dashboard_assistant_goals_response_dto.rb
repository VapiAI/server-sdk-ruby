# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardAssistantGoalsResponseDto < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::CallHealthDashboardAssistantGoalsDto] }, optional: false, nullable: false
    end
  end
end
