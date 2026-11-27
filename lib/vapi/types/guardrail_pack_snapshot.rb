# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailPackSnapshot < Internal::Types::Model
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: false, nullable: false
      field :rule_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "ruleIds"
    end
  end
end
