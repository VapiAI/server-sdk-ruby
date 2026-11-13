# frozen_string_literal: true

module Vapi
  module Types
    class AssistantGoalCreateDto < Internal::Types::Model
      field :succeeds_when, -> { String }, optional: false, nullable: false, api_name: "succeedsWhen"
      field :leave_out, -> { String }, optional: true, nullable: false, api_name: "leaveOut"
    end
  end
end
