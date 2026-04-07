# frozen_string_literal: true

module Vapi
  module Types
    class CodeTool < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CodeToolMessagesItem] }, optional: true, nullable: false
      field :async, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :code, -> { String }, optional: false, nullable: false
      field :environment_variables, -> { Internal::Types::Array[Vapi::Types::CodeToolEnvironmentVariable] }, optional: true, nullable: false, api_name: "environmentVariables"
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
      field :credential_id, -> { String }, optional: true, nullable: false, api_name: "credentialId"
      field :variable_extraction_plan, -> { Vapi::Types::VariableExtractionPlan }, optional: true, nullable: false, api_name: "variableExtractionPlan"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :function, -> { Vapi::Types::OpenAiFunction }, optional: true, nullable: false
    end
  end
end
