# frozen_string_literal: true

module Vapi
  module Types
    class TwilioPhoneNumber < Internal::Types::Model
      field :fallback_destination, -> { Vapi::Types::TwilioPhoneNumberFallbackDestination }, optional: true, nullable: false, api_name: "fallbackDestination"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::TwilioPhoneNumberHooksItem] }, optional: true, nullable: false
      field :sms_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "smsEnabled"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :status, -> { Vapi::Types::TwilioPhoneNumberStatus }, optional: true, nullable: false
      field :twilio_auth_token, -> { String }, optional: true, nullable: false, api_name: "twilioAuthToken"
      field :twilio_api_key, -> { String }, optional: true, nullable: false, api_name: "twilioApiKey"
      field :twilio_api_secret, -> { String }, optional: true, nullable: false, api_name: "twilioApiSecret"
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :number, -> { String }, optional: false, nullable: false
      field :twilio_account_sid, -> { String }, optional: false, nullable: false, api_name: "twilioAccountSid"
    end
  end
end
