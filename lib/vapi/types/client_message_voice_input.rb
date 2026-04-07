# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessageVoiceInput < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ClientMessageVoiceInputPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ClientMessageVoiceInputType }, optional: false, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :input, -> { String }, optional: false, nullable: false
    end
  end
end
