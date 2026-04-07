# frozen_string_literal: true

module Vapi
  module Types
    class Session < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :cost, -> { Integer }, optional: true, nullable: false
      field :costs, -> { Internal::Types::Array[Vapi::Types::SessionCostsItem] }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :status, -> { Vapi::Types::SessionStatus }, optional: true, nullable: false
      field :expiration_seconds, -> { Integer }, optional: true, nullable: false, api_name: "expirationSeconds"
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :squad, -> { Vapi::Types::CreateSquadDto }, optional: true, nullable: false
      field :messages, -> { Internal::Types::Array[Vapi::Types::SessionMessagesItem] }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"
      field :phone_number_id, -> { String }, optional: true, nullable: false, api_name: "phoneNumberId"
      field :phone_number, -> { Vapi::Types::ImportTwilioPhoneNumberDto }, optional: true, nullable: false, api_name: "phoneNumber"
      field :artifact, -> { Vapi::Types::Artifact }, optional: true, nullable: false
    end
  end
end
