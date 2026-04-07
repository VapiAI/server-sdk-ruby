# frozen_string_literal: true

module Vapi
  module Types
    class CreateHandoffToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateHandoffToolDtoMessagesItem] }, optional: true, nullable: false
      field :default_result, -> { String }, optional: true, nullable: false, api_name: "defaultResult"
      field :destinations, -> { Internal::Types::Array[Vapi::Types::CreateHandoffToolDtoDestinationsItem] }, optional: true, nullable: false
      field :function, -> { Vapi::Types::OpenAiFunction }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
