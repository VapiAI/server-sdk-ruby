# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailPack < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: false, nullable: false
      field :rule_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "ruleIds"
    end
  end
end
