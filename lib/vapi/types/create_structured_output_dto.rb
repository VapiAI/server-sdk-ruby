# frozen_string_literal: true

module Vapi
  module Types
    # Configuration used to create a structured-output definition that extracts validated data from calls using an AI
    # model or regular expression.
    class CreateStructuredOutputDto < Internal::Types::Model
      field :type, -> { Vapi::Types::CreateStructuredOutputDtoType }, optional: true, nullable: false
      field :regex, -> { String }, optional: true, nullable: false
      field :model, -> { Vapi::Types::CreateStructuredOutputDtoModel }, optional: true, nullable: false
      field :compliance_plan, -> { Vapi::Types::ComplianceOverride }, optional: true, nullable: false, api_name: "compliancePlan"
      field :conditions, -> { Internal::Types::Array[Vapi::Types::CreateStructuredOutputDtoConditionsItem] }, optional: true, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :schema, -> { Vapi::Types::JsonSchema }, optional: false, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :assistant_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "assistantIds"
      field :workflow_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "workflowIds"
    end
  end
end
