# frozen_string_literal: true

module Vapi
  module Types
    class EvalRunTargetAssistant < Internal::Types::Model
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
    end
  end
end
