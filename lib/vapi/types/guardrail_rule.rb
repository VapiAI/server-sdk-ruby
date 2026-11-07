# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailRule < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: false, nullable: false
      field :authoring, -> { Vapi::Types::GuardrailAuthoring }, optional: true, nullable: false
      field :instructions, -> { String }, optional: true, nullable: false
      field :sensitivity, -> { Vapi::Types::GuardrailRuleSensitivity }, optional: false, nullable: false
      field :action, -> { Vapi::Types::GuardrailRuleAction }, optional: false, nullable: false
    end
  end
end
