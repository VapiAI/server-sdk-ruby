# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessageSessionCreated < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ClientMessageSessionCreatedPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ClientMessageSessionCreatedType }, optional: false, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :session, -> { Vapi::Types::Session }, optional: false, nullable: false
    end
  end
end
