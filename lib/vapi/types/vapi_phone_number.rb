# frozen_string_literal: true

module Vapi
  module Types
    class VapiPhoneNumber < Internal::Types::Model
      field :fallback_destination, -> { Vapi::Types::VapiPhoneNumberFallbackDestination }, optional: true, nullable: false, api_name: "fallbackDestination"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::VapiPhoneNumberHooksItem] }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :status, -> { Vapi::Types::VapiPhoneNumberStatus }, optional: true, nullable: false
      field :number, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :number_desired_area_code, -> { String }, optional: true, nullable: false, api_name: "numberDesiredAreaCode"
      field :sip_uri, -> { String }, optional: true, nullable: false, api_name: "sipUri"
      field :authentication, -> { Vapi::Types::SipAuthentication }, optional: true, nullable: false
    end
  end
end
