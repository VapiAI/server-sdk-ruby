# frozen_string_literal: true

module Vapi
  module Types
    class CreateCodeToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateCodeToolDtoMessagesItem] }, optional: true, nullable: false
      field :async, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :code, -> { String }, optional: false, nullable: false
      field :environment_variables, -> { Internal::Types::Array[Vapi::Types::CodeToolEnvironmentVariable] }, optional: true, nullable: false, api_name: "environmentVariables"
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
      field :credential_id, -> { String }, optional: true, nullable: false, api_name: "credentialId"
      field :variable_extraction_plan, -> { Vapi::Types::VariableExtractionPlan }, optional: true, nullable: false, api_name: "variableExtractionPlan"
      field :function, -> { Vapi::Types::OpenAiFunction }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
