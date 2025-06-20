# frozen_string_literal: true
require "date"
require "date"
require_relative "sip_trunk_gateway"
require_relative "sip_trunk_outbound_authentication_plan"
require_relative "sbc_configuration"
require "ostruct"
require "json"

module Vapi
  class ByoSipTrunkCredential
  # @return [String] This can be used to bring your own SIP trunks or to connect to a Carrier.
    attr_reader :provider
  # @return [String] This is the unique identifier for the credential.
    attr_reader :id
  # @return [String] This is the unique identifier for the org that this credential belongs to.
    attr_reader :org_id
  # @return [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    attr_reader :created_at
  # @return [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    attr_reader :updated_at
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [Array<Vapi::SipTrunkGateway>] This is the list of SIP trunk's gateways.
    attr_reader :gateways
  # @return [Vapi::SipTrunkOutboundAuthenticationPlan] This can be used to configure the outbound authentication if required by the SIP
#  trunk.
    attr_reader :outbound_authentication_plan
  # @return [Boolean] This ensures the outbound origination attempts have a leading plus. Defaults to
#  false to match conventional telecom behavior.
#  Usage:
#  - Vonage/Twilio requires leading plus for all outbound calls. Set this to true.
#  @default false
    attr_reader :outbound_leading_plus_enabled
  # @return [String] This can be used to configure the tech prefix on outbound calls. This is an
#  advanced property.
    attr_reader :tech_prefix
  # @return [String] This can be used to enable the SIP diversion header for authenticating the
#  calling number if the SIP trunk supports it. This is an advanced property.
    attr_reader :sip_diversion_header
  # @return [Vapi::SbcConfiguration] This is an advanced configuration for enterprise deployments. This uses the
#  onprem SBC to trunk into the SIP trunk's `gateways`, rather than the managed SBC
#  provided by Vapi.
    attr_reader :sbc_configuration
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String] This can be used to bring your own SIP trunks or to connect to a Carrier.
    # @param id [String] This is the unique identifier for the credential.
    # @param org_id [String] This is the unique identifier for the org that this credential belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the credential was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the assistant was last updated.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param gateways [Array<Vapi::SipTrunkGateway>] This is the list of SIP trunk's gateways.
    # @param outbound_authentication_plan [Vapi::SipTrunkOutboundAuthenticationPlan] This can be used to configure the outbound authentication if required by the SIP
#  trunk.
    # @param outbound_leading_plus_enabled [Boolean] This ensures the outbound origination attempts have a leading plus. Defaults to
#  false to match conventional telecom behavior.
#  Usage:
#  - Vonage/Twilio requires leading plus for all outbound calls. Set this to true.
#  @default false
    # @param tech_prefix [String] This can be used to configure the tech prefix on outbound calls. This is an
#  advanced property.
    # @param sip_diversion_header [String] This can be used to enable the SIP diversion header for authenticating the
#  calling number if the SIP trunk supports it. This is an advanced property.
    # @param sbc_configuration [Vapi::SbcConfiguration] This is an advanced configuration for enterprise deployments. This uses the
#  onprem SBC to trunk into the SIP trunk's `gateways`, rather than the managed SBC
#  provided by Vapi.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ByoSipTrunkCredential]
    def initialize(provider: OMIT, id:, org_id:, created_at:, updated_at:, name: OMIT, gateways:, outbound_authentication_plan: OMIT, outbound_leading_plus_enabled: OMIT, tech_prefix: OMIT, sip_diversion_header: OMIT, sbc_configuration: OMIT, additional_properties: nil)
      @provider = provider if provider != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @gateways = gateways
      @outbound_authentication_plan = outbound_authentication_plan if outbound_authentication_plan != OMIT
      @outbound_leading_plus_enabled = outbound_leading_plus_enabled if outbound_leading_plus_enabled != OMIT
      @tech_prefix = tech_prefix if tech_prefix != OMIT
      @sip_diversion_header = sip_diversion_header if sip_diversion_header != OMIT
      @sbc_configuration = sbc_configuration if sbc_configuration != OMIT
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "id": id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at, "name": name, "gateways": gateways, "outboundAuthenticationPlan": outbound_authentication_plan, "outboundLeadingPlusEnabled": outbound_leading_plus_enabled, "techPrefix": tech_prefix, "sipDiversionHeader": sip_diversion_header, "sbcConfiguration": sbc_configuration }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ByoSipTrunkCredential
    #
    # @param json_object [String] 
    # @return [Vapi::ByoSipTrunkCredential]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = unless parsed_json["createdAt"].nil?
  DateTime.parse(parsed_json["createdAt"])
else
  nil
end
      updated_at = unless parsed_json["updatedAt"].nil?
  DateTime.parse(parsed_json["updatedAt"])
else
  nil
end
      name = parsed_json["name"]
      gateways = parsed_json["gateways"]&.map do | item |
  item = item.to_json
  Vapi::SipTrunkGateway.from_json(json_object: item)
end
      unless parsed_json["outboundAuthenticationPlan"].nil?
        outbound_authentication_plan = parsed_json["outboundAuthenticationPlan"].to_json
        outbound_authentication_plan = Vapi::SipTrunkOutboundAuthenticationPlan.from_json(json_object: outbound_authentication_plan)
      else
        outbound_authentication_plan = nil
      end
      outbound_leading_plus_enabled = parsed_json["outboundLeadingPlusEnabled"]
      tech_prefix = parsed_json["techPrefix"]
      sip_diversion_header = parsed_json["sipDiversionHeader"]
      unless parsed_json["sbcConfiguration"].nil?
        sbc_configuration = parsed_json["sbcConfiguration"].to_json
        sbc_configuration = Vapi::SbcConfiguration.from_json(json_object: sbc_configuration)
      else
        sbc_configuration = nil
      end
      new(
        provider: provider,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        gateways: gateways,
        outbound_authentication_plan: outbound_authentication_plan,
        outbound_leading_plus_enabled: outbound_leading_plus_enabled,
        tech_prefix: tech_prefix,
        sip_diversion_header: sip_diversion_header,
        sbc_configuration: sbc_configuration,
        additional_properties: struct
      )
    end
# Serialize an instance of ByoSipTrunkCredential to a JSON object
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
      obj.provider&.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.gateways.is_a?(Array) != false || raise("Passed value for field obj.gateways is not the expected type, validation failed.")
      obj.outbound_authentication_plan.nil? || Vapi::SipTrunkOutboundAuthenticationPlan.validate_raw(obj: obj.outbound_authentication_plan)
      obj.outbound_leading_plus_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.outbound_leading_plus_enabled is not the expected type, validation failed.")
      obj.tech_prefix&.is_a?(String) != false || raise("Passed value for field obj.tech_prefix is not the expected type, validation failed.")
      obj.sip_diversion_header&.is_a?(String) != false || raise("Passed value for field obj.sip_diversion_header is not the expected type, validation failed.")
      obj.sbc_configuration.nil? || Vapi::SbcConfiguration.validate_raw(obj: obj.sbc_configuration)
    end
  end
end