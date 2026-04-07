# frozen_string_literal: true

module Vapi
  module Types
    class SipTrunkOutboundAuthenticationPlan < Internal::Types::Model
      field :auth_password, -> { String }, optional: true, nullable: false, api_name: "authPassword"
      field :auth_username, -> { String }, optional: true, nullable: false, api_name: "authUsername"
      field :sip_register_plan, -> { Vapi::Types::SipTrunkOutboundSipRegisterPlan }, optional: true, nullable: false, api_name: "sipRegisterPlan"
    end
  end
end
