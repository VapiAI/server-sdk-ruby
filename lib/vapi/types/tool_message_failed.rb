# frozen_string_literal: true

module Vapi
  module Types
    class ToolMessageFailed < Internal::Types::Model
      field :contents, -> { Internal::Types::Array[Vapi::Types::TextContent] }, optional: true, nullable: false
      field :end_call_after_spoken_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "endCallAfterSpokenEnabled"
      field :content, -> { String }, optional: true, nullable: false
      field :conditions, -> { Internal::Types::Array[Vapi::Types::Condition] }, optional: true, nullable: false
    end
  end
end
