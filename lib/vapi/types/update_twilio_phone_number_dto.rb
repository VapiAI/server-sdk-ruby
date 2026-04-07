# frozen_string_literal: true

module Vapi
  module Types
    class UpdateTwilioPhoneNumberDto < Internal::Types::Model
      field :fallback_destination, -> { Vapi::Types::UpdateTwilioPhoneNumberDtoFallbackDestination }, optional: true, nullable: false, api_name: "fallbackDestination"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::UpdateTwilioPhoneNumberDtoHooksItem] }, optional: true, nullable: false
      field :sms_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "smsEnabled"
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :number, -> { String }, optional: true, nullable: false
      field :twilio_account_sid, -> { String }, optional: true, nullable: false, api_name: "twilioAccountSid"
      field :twilio_auth_token, -> { String }, optional: true, nullable: false, api_name: "twilioAuthToken"
      field :twilio_api_key, -> { String }, optional: true, nullable: false, api_name: "twilioApiKey"
      field :twilio_api_secret, -> { String }, optional: true, nullable: false, api_name: "twilioApiSecret"
    end
  end
end
