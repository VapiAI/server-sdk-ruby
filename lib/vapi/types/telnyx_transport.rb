# frozen_string_literal: true

module Vapi
  module Types
    class TelnyxTransport < Internal::Types::Model
      field :conversation_type, -> { Vapi::Types::TelnyxTransportConversationType }, optional: true, nullable: false, api_name: "conversationType"
      field :call_control_id, -> { String }, optional: true, nullable: false, api_name: "callControlId"
      field :call_leg_id, -> { String }, optional: true, nullable: false, api_name: "callLegId"
      field :call_session_id, -> { String }, optional: true, nullable: false, api_name: "callSessionId"
    end
  end
end
