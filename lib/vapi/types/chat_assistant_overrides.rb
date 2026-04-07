# frozen_string_literal: true

module Vapi
  module Types
    class ChatAssistantOverrides < Internal::Types::Model
      field :variable_values, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "variableValues"
    end
  end
end
