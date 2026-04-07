# frozen_string_literal: true

module Vapi
  module Types
    class UpdateVapiPhoneNumberDto < Internal::Types::Model
      field :fallback_destination, -> { Vapi::Types::UpdateVapiPhoneNumberDtoFallbackDestination }, optional: true, nullable: false, api_name: "fallbackDestination"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::UpdateVapiPhoneNumberDtoHooksItem] }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :sip_uri, -> { String }, optional: true, nullable: false, api_name: "sipUri"
      field :authentication, -> { Vapi::Types::SipAuthentication }, optional: true, nullable: false
    end
  end
end
