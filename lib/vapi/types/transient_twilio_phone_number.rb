# frozen_string_literal: true

module Vapi
  module Types
    class TransientTwilioPhoneNumber < Internal::Types::Model
      field :fallback_destination, -> { Vapi::Types::TransientTwilioPhoneNumberFallbackDestination }, optional: true, nullable: false, api_name: "fallbackDestination"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::TransientTwilioPhoneNumberHooksItem] }, optional: true, nullable: false
      field :sms_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "smsEnabled"
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :twilio_phone_number, -> { String }, optional: false, nullable: false, api_name: "twilioPhoneNumber"
      field :twilio_account_sid, -> { String }, optional: false, nullable: false, api_name: "twilioAccountSid"
    end
  end
end
