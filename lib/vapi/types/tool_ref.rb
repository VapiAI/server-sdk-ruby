# frozen_string_literal: true

module Vapi
  module Types
    class ToolRef < Internal::Types::Model
      field :tool_id, -> { String }, optional: false, nullable: false, api_name: "toolId"
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
