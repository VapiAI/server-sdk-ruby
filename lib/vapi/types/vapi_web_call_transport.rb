# frozen_string_literal: true

module Vapi
  module Types
    class VapiWebCallTransport < Internal::Types::Model
      field :conversation_type, -> { Vapi::Types::VapiWebCallTransportConversationType }, optional: true, nullable: false, api_name: "conversationType"
      field :room_delete_on_user_leave_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "roomDeleteOnUserLeaveEnabled"
      field :call_url, -> { String }, optional: true, nullable: false, api_name: "callUrl"
      field :call_sip_uri, -> { String }, optional: true, nullable: false, api_name: "callSipUri"
    end
  end
end
