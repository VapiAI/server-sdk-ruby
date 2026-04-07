# frozen_string_literal: true

module Vapi
  module StructuredOutputs
    module Types
      class UpdateStructuredOutputDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :schema_override, -> { String }, optional: false, nullable: false, api_name: "schemaOverride"
        field :type, -> { Vapi::StructuredOutputs::Types::UpdateStructuredOutputDtoType }, optional: true, nullable: false
        field :regex, -> { String }, optional: true, nullable: false
        field :model, -> { Vapi::StructuredOutputs::Types::UpdateStructuredOutputDtoModel }, optional: true, nullable: false
        field :compliance_plan, -> { Vapi::Types::ComplianceOverride }, optional: true, nullable: false, api_name: "compliancePlan"
        field :name, -> { String }, optional: true, nullable: false
        field :description, -> { String }, optional: true, nullable: false
        field :assistant_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "assistantIds"
        field :workflow_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "workflowIds"
        field :schema, -> { Vapi::Types::JsonSchema }, optional: true, nullable: false
      end
    end
  end
end
