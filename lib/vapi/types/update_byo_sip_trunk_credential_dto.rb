# frozen_string_literal: true

module Vapi
  module Types
    class UpdateByoSipTrunkCredentialDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :gateways, -> { Internal::Types::Array[Vapi::Types::SipTrunkGateway] }, optional: true, nullable: false
      field :outbound_authentication_plan, -> { Vapi::Types::SipTrunkOutboundAuthenticationPlan }, optional: true, nullable: false, api_name: "outboundAuthenticationPlan"
      field :outbound_leading_plus_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "outboundLeadingPlusEnabled"
      field :tech_prefix, -> { String }, optional: true, nullable: false, api_name: "techPrefix"
      field :sip_diversion_header, -> { String }, optional: true, nullable: false, api_name: "sipDiversionHeader"
      field :sbc_configuration, -> { Vapi::Types::SbcConfiguration }, optional: true, nullable: false, api_name: "sbcConfiguration"
    end
  end
end
