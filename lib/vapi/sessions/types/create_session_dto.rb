# frozen_string_literal: true

module Vapi
  module Sessions
    module Types
      class CreateSessionDto < Internal::Types::Model
        field :name, -> { String }, optional: true, nullable: false
        field :status, -> { Vapi::Sessions::Types::CreateSessionDtoStatus }, optional: true, nullable: false
        field :expiration_seconds, -> { Integer }, optional: true, nullable: false, api_name: "expirationSeconds"
        field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
        field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
        field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
        field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
        field :squad, -> { Vapi::Types::CreateSquadDto }, optional: true, nullable: false
        field :messages, -> { Internal::Types::Array[Vapi::Sessions::Types::CreateSessionDtoMessagesItem] }, optional: true, nullable: false
        field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
        field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"
        field :phone_number_id, -> { String }, optional: true, nullable: false, api_name: "phoneNumberId"
        field :phone_number, -> { Vapi::Types::ImportTwilioPhoneNumberDto }, optional: true, nullable: false, api_name: "phoneNumber"
      end
    end
  end
end
