# frozen_string_literal: true

module Vapi
  module Types
    class SimulationOnboardingToolGapDto < Internal::Types::Model
      field :tool_name, -> { String }, optional: false, nullable: false, api_name: "toolName"
      field :assistant_name, -> { String }, optional: true, nullable: false, api_name: "assistantName"
      field :reason, -> { Vapi::Types::SimulationOnboardingToolGapDtoReason }, optional: false, nullable: false
      field :destination_names, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "destinationNames"
    end
  end
end
