# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailRuleSnapshot < Internal::Types::Model
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: false, nullable: false
      field :authoring, -> { Vapi::Types::GuardrailAuthoring }, optional: true, nullable: false
      field :instructions, -> { String }, optional: false, nullable: false
      field :sensitivity, -> { Vapi::Types::GuardrailRuleSnapshotSensitivity }, optional: false, nullable: false
      field :action, -> { Vapi::Types::GuardrailRuleSnapshotAction }, optional: false, nullable: false
    end
  end
end
