# frozen_string_literal: true

module Vapi
  module Types
    class StructuredOutput < Internal::Types::Model
      field :type, -> { Vapi::Types::StructuredOutputType }, optional: true, nullable: false
      field :regex, -> { String }, optional: true, nullable: false
      field :model, -> { Vapi::Types::StructuredOutputModel }, optional: true, nullable: false
      field :compliance_plan, -> { Vapi::Types::ComplianceOverride }, optional: true, nullable: false, api_name: "compliancePlan"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :assistant_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "assistantIds"
      field :workflow_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "workflowIds"
      field :schema, -> { Vapi::Types::JsonSchema }, optional: false, nullable: false
    end
  end
end
