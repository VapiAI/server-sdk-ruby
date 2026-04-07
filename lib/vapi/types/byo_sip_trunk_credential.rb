# frozen_string_literal: true

module Vapi
  module Types
    class ByoSipTrunkCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::ByoSipTrunkCredentialProvider }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
      field :gateways, -> { Internal::Types::Array[Vapi::Types::SipTrunkGateway] }, optional: false, nullable: false
      field :outbound_authentication_plan, -> { Vapi::Types::SipTrunkOutboundAuthenticationPlan }, optional: true, nullable: false, api_name: "outboundAuthenticationPlan"
      field :outbound_leading_plus_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "outboundLeadingPlusEnabled"
      field :tech_prefix, -> { String }, optional: true, nullable: false, api_name: "techPrefix"
      field :sip_diversion_header, -> { String }, optional: true, nullable: false, api_name: "sipDiversionHeader"
      field :sbc_configuration, -> { Vapi::Types::SbcConfiguration }, optional: true, nullable: false, api_name: "sbcConfiguration"
    end
  end
end
