# frozen_string_literal: true

module Vapi
  module Types
    # Credentials and optional SIP REGISTER settings used to authenticate outbound calls with a SIP trunk.
    class SipTrunkOutboundAuthenticationPlan < Internal::Types::Model
      field :auth_password, -> { String }, optional: true, nullable: false, api_name: "authPassword"
      field :sip_register_plan, -> { Vapi::Types::SipTrunkOutboundSipRegisterPlan }, optional: true, nullable: false, api_name: "sipRegisterPlan"
      field :auth_username, -> { String }, optional: true, nullable: false, api_name: "authUsername"
    end
  end
end
