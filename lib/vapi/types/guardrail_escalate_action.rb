# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailEscalateAction < Internal::Types::Model
      field :type, -> { Vapi::Types::GuardrailEscalateActionType }, optional: false, nullable: false
      field :tool_id, -> { String }, optional: false, nullable: false, api_name: "toolId"
      field :arguments, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
