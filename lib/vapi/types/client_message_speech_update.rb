# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessageSpeechUpdate < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ClientMessageSpeechUpdatePhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ClientMessageSpeechUpdateType }, optional: false, nullable: false
      field :status, -> { Vapi::Types::ClientMessageSpeechUpdateStatus }, optional: false, nullable: false
      field :role, -> { Vapi::Types::ClientMessageSpeechUpdateRole }, optional: false, nullable: false
      field :turn, -> { Integer }, optional: true, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
    end
  end
end
