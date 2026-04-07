# frozen_string_literal: true

module Vapi
  module Types
    class ImportTwilioPhoneNumberDto < Internal::Types::Model
      field :fallback_destination, -> { Vapi::Types::ImportTwilioPhoneNumberDtoFallbackDestination }, optional: true, nullable: false, api_name: "fallbackDestination"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::ImportTwilioPhoneNumberDtoHooksItem] }, optional: true, nullable: false
      field :sms_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "smsEnabled"
      field :twilio_phone_number, -> { String }, optional: false, nullable: false, api_name: "twilioPhoneNumber"
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
