# frozen_string_literal: true

module Vapi
  module Types
    class TwilioTransport < Internal::Types::Model
      field :conversation_type, -> { Vapi::Types::TwilioTransportConversationType }, optional: true, nullable: false, api_name: "conversationType"
      field :account_sid, -> { String }, optional: true, nullable: false, api_name: "accountSid"
      field :call_sid, -> { String }, optional: true, nullable: false, api_name: "callSid"
      field :call_token, -> { String }, optional: true, nullable: false, api_name: "callToken"
      field :forwarded_from, -> { String }, optional: true, nullable: false, api_name: "forwardedFrom"
    end
  end
end
