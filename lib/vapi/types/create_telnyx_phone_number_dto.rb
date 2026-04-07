# frozen_string_literal: true

module Vapi
  module Types
    class CreateTelnyxPhoneNumberDto < Internal::Types::Model
      field :fallback_destination, -> { Vapi::Types::CreateTelnyxPhoneNumberDtoFallbackDestination }, optional: true, nullable: false, api_name: "fallbackDestination"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::CreateTelnyxPhoneNumberDtoHooksItem] }, optional: true, nullable: false
      field :number, -> { String }, optional: false, nullable: false
      field :credential_id, -> { String }, optional: false, nullable: false, api_name: "credentialId"
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
    end
  end
end
