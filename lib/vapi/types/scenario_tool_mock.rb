# frozen_string_literal: true

module Vapi
  module Types
    class ScenarioToolMock < Internal::Types::Model
      field :tool_name, -> { String }, optional: false, nullable: false, api_name: "toolName"
      field :result, -> { String }, optional: true, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
