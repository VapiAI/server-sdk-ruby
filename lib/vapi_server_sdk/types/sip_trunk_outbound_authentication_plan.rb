# frozen_string_literal: true

require_relative "sip_trunk_outbound_sip_register_plan"
require "ostruct"
require "json"

module Vapi
  class SipTrunkOutboundAuthenticationPlan
    # @return [String] This is not returned in the API.
    attr_reader :auth_password
    # @return [String]
    attr_reader :auth_username
    # @return [Vapi::SipTrunkOutboundSipRegisterPlan] This can be used to configure if SIP register is required by the SIP trunk. If
    #  not provided, no SIP registration will be attempted.
    attr_reader :sip_register_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param auth_password [String] This is not returned in the API.
    # @param auth_username [String]
    # @param sip_register_plan [Vapi::SipTrunkOutboundSipRegisterPlan] This can be used to configure if SIP register is required by the SIP trunk. If
    #  not provided, no SIP registration will be attempted.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SipTrunkOutboundAuthenticationPlan]
    def initialize(auth_password: OMIT, auth_username: OMIT, sip_register_plan: OMIT, additional_properties: nil)
      @auth_password = auth_password if auth_password != OMIT
      @auth_username = auth_username if auth_username != OMIT
      @sip_register_plan = sip_register_plan if sip_register_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "authPassword": auth_password,
        "authUsername": auth_username,
        "sipRegisterPlan": sip_register_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SipTrunkOutboundAuthenticationPlan
    #
    # @param json_object [String]
    # @return [Vapi::SipTrunkOutboundAuthenticationPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      auth_password = parsed_json["authPassword"]
      auth_username = parsed_json["authUsername"]
      if parsed_json["sipRegisterPlan"].nil?
        sip_register_plan = nil
      else
        sip_register_plan = parsed_json["sipRegisterPlan"].to_json
        sip_register_plan = Vapi::SipTrunkOutboundSipRegisterPlan.from_json(json_object: sip_register_plan)
      end
      new(
        auth_password: auth_password,
        auth_username: auth_username,
        sip_register_plan: sip_register_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of SipTrunkOutboundAuthenticationPlan to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.auth_password&.is_a?(String) != false || raise("Passed value for field obj.auth_password is not the expected type, validation failed.")
      obj.auth_username&.is_a?(String) != false || raise("Passed value for field obj.auth_username is not the expected type, validation failed.")
      obj.sip_register_plan.nil? || Vapi::SipTrunkOutboundSipRegisterPlan.validate_raw(obj: obj.sip_register_plan)
    end
  end
end
