# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessageChatCreated < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ClientMessageChatCreatedPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ClientMessageChatCreatedType }, optional: false, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :chat, -> { Vapi::Types::Chat }, optional: false, nullable: false
    end
  end
end
