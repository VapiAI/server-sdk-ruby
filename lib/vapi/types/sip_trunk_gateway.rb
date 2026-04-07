# frozen_string_literal: true

module Vapi
  module Types
    class SipTrunkGateway < Internal::Types::Model
      field :ip, -> { String }, optional: false, nullable: false
      field :port, -> { Integer }, optional: true, nullable: false
      field :netmask, -> { Integer }, optional: true, nullable: false
      field :inbound_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "inboundEnabled"
      field :outbound_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "outboundEnabled"
      field :outbound_protocol, -> { Vapi::Types::SipTrunkGatewayOutboundProtocol }, optional: true, nullable: false, api_name: "outboundProtocol"
      field :options_ping_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "optionsPingEnabled"
    end
  end
end
