# frozen_string_literal: true

module Vapi
  module Types
    class ToolNode < Internal::Types::Model
      field :tool, -> { Vapi::Types::ToolNodeTool }, optional: true, nullable: false
      field :tool_id, -> { String }, optional: true, nullable: false, api_name: "toolId"
      field :name, -> { String }, optional: false, nullable: false
      field :is_start, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isStart"
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
