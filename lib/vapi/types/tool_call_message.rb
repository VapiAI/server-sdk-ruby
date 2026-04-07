# frozen_string_literal: true

module Vapi
  module Types
    class ToolCallMessage < Internal::Types::Model
      field :role, -> { String }, optional: false, nullable: false
      field :tool_calls, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false, api_name: "toolCalls"
      field :message, -> { String }, optional: false, nullable: false
      field :time, -> { Integer }, optional: false, nullable: false
      field :seconds_from_start, -> { Integer }, optional: false, nullable: false, api_name: "secondsFromStart"
    end
  end
end
