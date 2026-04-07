# frozen_string_literal: true

module Vapi
  module Types
    class VonagePhoneNumber < Internal::Types::Model
      field :fallback_destination, -> { Vapi::Types::VonagePhoneNumberFallbackDestination }, optional: true, nullable: false, api_name: "fallbackDestination"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::VonagePhoneNumberHooksItem] }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :status, -> { Vapi::Types::VonagePhoneNumberStatus }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :number, -> { String }, optional: false, nullable: false
      field :credential_id, -> { String }, optional: false, nullable: false, api_name: "credentialId"
    end
  end
end
