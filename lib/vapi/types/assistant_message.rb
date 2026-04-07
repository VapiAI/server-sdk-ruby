# frozen_string_literal: true

module Vapi
  module Types
    class AssistantMessage < Internal::Types::Model
      field :role, -> { Vapi::Types::AssistantMessageRole }, optional: false, nullable: false
      field :content, -> { String }, optional: true, nullable: false
      field :refusal, -> { String }, optional: true, nullable: false
      field :tool_calls, -> { Internal::Types::Array[Vapi::Types::ToolCall] }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
