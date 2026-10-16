# frozen_string_literal: true

module Vapi
  module Types
    # Message spoken when a tool call exceeds a configured response delay, with optional language variants and argument
    # conditions.
    class ToolMessageDelayed < Internal::Types::Model
      field :contents, -> { Internal::Types::Array[Vapi::Types::TextContent] }, optional: true, nullable: false
      field :timing_milliseconds, -> { Integer }, optional: true, nullable: false, api_name: "timingMilliseconds"
      field :content, -> { String }, optional: true, nullable: false
      field :conditions, -> { Internal::Types::Array[Vapi::Types::Condition] }, optional: true, nullable: false
    end
  end
end
