# frozen_string_literal: true

module Vapi
  module Types
    # An entry in the call message history that records the result and metadata for a completed tool call.
    class ToolCallResultMessage < Internal::Types::Model
      field :role, -> { String }, optional: false, nullable: false
      field :tool_call_id, -> { String }, optional: false, nullable: false, api_name: "toolCallId"
      field :name, -> { String }, optional: false, nullable: false
      field :result, -> { String }, optional: false, nullable: false
      field :time, -> { Integer }, optional: false, nullable: false
      field :seconds_from_start, -> { Integer }, optional: false, nullable: false, api_name: "secondsFromStart"
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :warnings, -> { Internal::Types::Array[Vapi::Types::ToolCallResultMessageWarning] }, optional: true, nullable: false
    end
  end
end
