# frozen_string_literal: true

module Vapi
  module Types
    class TesterPlan < Internal::Types::Model
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
    end
  end
end
