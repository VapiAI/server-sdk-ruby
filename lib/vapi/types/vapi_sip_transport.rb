# frozen_string_literal: true

module Vapi
  module Types
    class VapiSipTransport < Internal::Types::Model
      field :conversation_type, -> { Vapi::Types::VapiSipTransportConversationType }, optional: true, nullable: false, api_name: "conversationType"
      field :dial_timeout, -> { Integer }, optional: true, nullable: false, api_name: "dialTimeout"
      field :sbc_call_sid, -> { String }, optional: true, nullable: false, api_name: "sbcCallSid"
      field :call_sid, -> { String }, optional: true, nullable: false, api_name: "callSid"
    end
  end
end
