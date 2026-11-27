# frozen_string_literal: true

module Vapi
  module Types
    class CreateGuardrailRuleDto < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :authoring, -> { Vapi::Types::GuardrailAuthoring }, optional: true, nullable: false
      field :instructions, -> { String }, optional: true, nullable: false
      field :sensitivity, -> { Vapi::Types::CreateGuardrailRuleDtoSensitivity }, optional: false, nullable: false
      field :action, -> { Vapi::Types::CreateGuardrailRuleDtoAction }, optional: false, nullable: false
    end
  end
end
