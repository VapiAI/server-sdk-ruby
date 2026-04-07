# frozen_string_literal: true

module Vapi
  module Types
    class ToolMessage < Internal::Types::Model
      field :role, -> { Vapi::Types::ToolMessageRole }, optional: false, nullable: false
      field :content, -> { String }, optional: false, nullable: false
      field :tool_call_id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
