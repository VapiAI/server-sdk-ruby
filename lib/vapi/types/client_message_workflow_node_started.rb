# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessageWorkflowNodeStarted < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ClientMessageWorkflowNodeStartedPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ClientMessageWorkflowNodeStartedType }, optional: false, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :node, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
