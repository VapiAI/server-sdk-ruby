# frozen_string_literal: true

module Vapi
  module Types
    class CreateFunctionToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateFunctionToolDtoMessagesItem] }, optional: true, nullable: false
      field :async, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :variable_extraction_plan, -> { Vapi::Types::VariableExtractionPlan }, optional: true, nullable: false, api_name: "variableExtractionPlan"
      field :parameters, -> { Internal::Types::Array[Vapi::Types::ToolParameter] }, optional: true, nullable: false
      field :function, -> { Vapi::Types::OpenAiFunction }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
