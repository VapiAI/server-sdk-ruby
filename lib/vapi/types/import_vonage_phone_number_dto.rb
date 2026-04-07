# frozen_string_literal: true

module Vapi
  module Types
    class ImportVonagePhoneNumberDto < Internal::Types::Model
      field :fallback_destination, -> { Vapi::Types::ImportVonagePhoneNumberDtoFallbackDestination }, optional: true, nullable: false, api_name: "fallbackDestination"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::ImportVonagePhoneNumberDtoHooksItem] }, optional: true, nullable: false
      field :vonage_phone_number, -> { String }, optional: false, nullable: false, api_name: "vonagePhoneNumber"
      field :credential_id, -> { String }, optional: false, nullable: false, api_name: "credentialId"
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
    end
  end
end
