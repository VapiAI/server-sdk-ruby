# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessageAssistantStarted < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ClientMessageAssistantStartedPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ClientMessageAssistantStartedType }, optional: false, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :new_assistant, -> { Vapi::Types::CreateAssistantDto }, optional: false, nullable: false, api_name: "newAssistant"
    end
  end
end
