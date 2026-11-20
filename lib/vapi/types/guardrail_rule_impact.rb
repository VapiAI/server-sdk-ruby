# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailRuleImpact < Internal::Types::Model
      field :assistant_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "assistantIds"
      field :pack_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "packIds"
      field :assistants, -> { Internal::Types::Array[Vapi::Types::GuardrailRuleUsage] }, optional: false, nullable: false
      field :packs, -> { Internal::Types::Array[Vapi::Types::GuardrailRuleUsage] }, optional: false, nullable: false
    end
  end
end
