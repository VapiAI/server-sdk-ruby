# frozen_string_literal: true

module Vapi
  module Types
    class ToolCallResult < Internal::Types::Model
      field :message, -> { Vapi::Types::ToolCallResultMessage }, optional: true, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :tool_call_id, -> { String }, optional: false, nullable: false, api_name: "toolCallId"
      field :result, -> { String }, optional: true, nullable: false
      field :error, -> { String }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
