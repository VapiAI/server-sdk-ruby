# frozen_string_literal: true

module Vapi
  module Types
    class CreateTwilioPhoneNumberDto < Internal::Types::Model
      field :fallback_destination, -> { Vapi::Types::CreateTwilioPhoneNumberDtoFallbackDestination }, optional: true, nullable: false, api_name: "fallbackDestination"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::CreateTwilioPhoneNumberDtoHooksItem] }, optional: true, nullable: false
      field :sms_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "smsEnabled"
      field :number, -> { String }, optional: false, nullable: false
      field :twilio_account_sid, -> { String }, optional: false, nullable: false, api_name: "twilioAccountSid"
      field :twilio_auth_token, -> { String }, optional: true, nullable: false, api_name: "twilioAuthToken"
      field :twilio_api_key, -> { String }, optional: true, nullable: false, api_name: "twilioApiKey"
      field :twilio_api_secret, -> { String }, optional: true, nullable: false, api_name: "twilioApiSecret"
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
    end
  end
end
