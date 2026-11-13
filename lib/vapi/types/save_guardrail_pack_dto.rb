# frozen_string_literal: true

module Vapi
  module Types
    class SaveGuardrailPackDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :rule_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "ruleIds"
      field :expected, -> { Vapi::Types::GuardrailPackSnapshot }, optional: false, nullable: false
      field :confirmed_assistant_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "confirmedAssistantIds"
    end
  end
end
