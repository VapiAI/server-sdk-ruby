# frozen_string_literal: true

module Vapi
  module Types
    class ToolCallResultMessage < Internal::Types::Model
      field :role, -> { String }, optional: false, nullable: false
      field :tool_call_id, -> { String }, optional: false, nullable: false, api_name: "toolCallId"
      field :name, -> { String }, optional: false, nullable: false
      field :result, -> { String }, optional: false, nullable: false
      field :time, -> { Integer }, optional: false, nullable: false
      field :seconds_from_start, -> { Integer }, optional: false, nullable: false, api_name: "secondsFromStart"
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
