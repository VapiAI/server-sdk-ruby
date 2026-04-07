# frozen_string_literal: true

module Vapi
  module Types
    class ApiRequestTool < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::ApiRequestToolMessagesItem] }, optional: true, nullable: false
      field :method_, -> { Vapi::Types::ApiRequestToolMethod }, optional: false, nullable: false, api_name: "method"
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
      field :credential_id, -> { String }, optional: true, nullable: false, api_name: "credentialId"
      field :encrypted_paths, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "encryptedPaths"
      field :parameters, -> { Internal::Types::Array[Vapi::Types::ToolParameter] }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :url, -> { String }, optional: false, nullable: false
      field :body, -> { Vapi::Types::JsonSchema }, optional: true, nullable: false
      field :headers, -> { Vapi::Types::JsonSchema }, optional: true, nullable: false
      field :backoff_plan, -> { Vapi::Types::BackoffPlan }, optional: true, nullable: false, api_name: "backoffPlan"
      field :variable_extraction_plan, -> { Vapi::Types::VariableExtractionPlan }, optional: true, nullable: false, api_name: "variableExtractionPlan"
    end
  end
end
