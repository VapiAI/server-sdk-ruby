# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunTargetAssistant < Internal::Types::Model
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
    end
  end
end
