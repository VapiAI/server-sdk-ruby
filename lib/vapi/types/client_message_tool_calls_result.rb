# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessageToolCallsResult < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ClientMessageToolCallsResultPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ClientMessageToolCallsResultType }, optional: false, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :tool_call_result, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false, api_name: "toolCallResult"
    end
  end
end
