# frozen_string_literal: true
require_relative "sip_trunk_gateway_outbound_protocol"
require "ostruct"
require "json"

module Vapi
  class SipTrunkGateway
  # @return [String] This is the address of the gateway. It can be an IPv4 address like 1.1.1.1 or a
#  fully qualified domain name like my-sip-trunk.pstn.twilio.com.
    attr_reader :ip
  # @return [Float] This is the port number of the gateway. Default is 5060.
#  @default 5060
    attr_reader :port
  # @return [Float] This is the netmask of the gateway. Defaults to 32.
#  @default 32
    attr_reader :netmask
  # @return [Boolean] This is whether inbound calls are allowed from this gateway. Default is true.
#  @default true
    attr_reader :inbound_enabled
  # @return [Boolean] This is whether outbound calls should be sent to this gateway. Default is true.
#  Note, if netmask is less than 32, it doesn't affect the outbound IPs that are
#  tried. 1 attempt is made to `ip:port`.
#  @default true
    attr_reader :outbound_enabled
  # @return [Vapi::SipTrunkGatewayOutboundProtocol] This is the protocol to use for SIP signaling outbound calls. Default is udp.
#  @default udp
    attr_reader :outbound_protocol
  # @return [Boolean] This is whether to send options ping to the gateway. This can be used to check
#  if the gateway is reachable. Default is false.
#  This is useful for high availability setups where you want to check if the
#  gateway is reachable before routing calls to it. Note, if no gateway for a trunk
#  is reachable, outbound calls will be rejected.
#  @default false
    attr_reader :options_ping_enabled
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param ip [String] This is the address of the gateway. It can be an IPv4 address like 1.1.1.1 or a
#  fully qualified domain name like my-sip-trunk.pstn.twilio.com.
    # @param port [Float] This is the port number of the gateway. Default is 5060.
#  @default 5060
    # @param netmask [Float] This is the netmask of the gateway. Defaults to 32.
#  @default 32
    # @param inbound_enabled [Boolean] This is whether inbound calls are allowed from this gateway. Default is true.
#  @default true
    # @param outbound_enabled [Boolean] This is whether outbound calls should be sent to this gateway. Default is true.
#  Note, if netmask is less than 32, it doesn't affect the outbound IPs that are
#  tried. 1 attempt is made to `ip:port`.
#  @default true
    # @param outbound_protocol [Vapi::SipTrunkGatewayOutboundProtocol] This is the protocol to use for SIP signaling outbound calls. Default is udp.
#  @default udp
    # @param options_ping_enabled [Boolean] This is whether to send options ping to the gateway. This can be used to check
#  if the gateway is reachable. Default is false.
#  This is useful for high availability setups where you want to check if the
#  gateway is reachable before routing calls to it. Note, if no gateway for a trunk
#  is reachable, outbound calls will be rejected.
#  @default false
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SipTrunkGateway]
    def initialize(ip:, port: OMIT, netmask: OMIT, inbound_enabled: OMIT, outbound_enabled: OMIT, outbound_protocol: OMIT, options_ping_enabled: OMIT, additional_properties: nil)
      @ip = ip
      @port = port if port != OMIT
      @netmask = netmask if netmask != OMIT
      @inbound_enabled = inbound_enabled if inbound_enabled != OMIT
      @outbound_enabled = outbound_enabled if outbound_enabled != OMIT
      @outbound_protocol = outbound_protocol if outbound_protocol != OMIT
      @options_ping_enabled = options_ping_enabled if options_ping_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = { "ip": ip, "port": port, "netmask": netmask, "inboundEnabled": inbound_enabled, "outboundEnabled": outbound_enabled, "outboundProtocol": outbound_protocol, "optionsPingEnabled": options_ping_enabled }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SipTrunkGateway
    #
    # @param json_object [String] 
    # @return [Vapi::SipTrunkGateway]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      ip = parsed_json["ip"]
      port = parsed_json["port"]
      netmask = parsed_json["netmask"]
      inbound_enabled = parsed_json["inboundEnabled"]
      outbound_enabled = parsed_json["outboundEnabled"]
      outbound_protocol = parsed_json["outboundProtocol"]
      options_ping_enabled = parsed_json["optionsPingEnabled"]
      new(
        ip: ip,
        port: port,
        netmask: netmask,
        inbound_enabled: inbound_enabled,
        outbound_enabled: outbound_enabled,
        outbound_protocol: outbound_protocol,
        options_ping_enabled: options_ping_enabled,
        additional_properties: struct
      )
    end
# Serialize an instance of SipTrunkGateway to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.ip.is_a?(String) != false || raise("Passed value for field obj.ip is not the expected type, validation failed.")
      obj.port&.is_a?(Float) != false || raise("Passed value for field obj.port is not the expected type, validation failed.")
      obj.netmask&.is_a?(Float) != false || raise("Passed value for field obj.netmask is not the expected type, validation failed.")
      obj.inbound_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.inbound_enabled is not the expected type, validation failed.")
      obj.outbound_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.outbound_enabled is not the expected type, validation failed.")
      obj.outbound_protocol&.is_a?(Vapi::SipTrunkGatewayOutboundProtocol) != false || raise("Passed value for field obj.outbound_protocol is not the expected type, validation failed.")
      obj.options_ping_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.options_ping_enabled is not the expected type, validation failed.")
    end
  end
end