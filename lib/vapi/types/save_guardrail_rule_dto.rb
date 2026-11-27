# frozen_string_literal: true

module Vapi
  module Types
    class SaveGuardrailRuleDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :authoring, -> { Vapi::Types::GuardrailAuthoring }, optional: true, nullable: false
      field :instructions, -> { String }, optional: true, nullable: false
      field :sensitivity, -> { Vapi::Types::SaveGuardrailRuleDtoSensitivity }, optional: true, nullable: false
      field :action, -> { Vapi::Types::SaveGuardrailRuleDtoAction }, optional: true, nullable: false
      field :expected, -> { Vapi::Types::GuardrailRuleSnapshot }, optional: false, nullable: false
      field :confirmed_assistant_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "confirmedAssistantIds"
    end
  end
end
