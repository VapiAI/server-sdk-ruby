# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class SipTrunkOutboundSipRegisterPlan
  # @return [String] 
    attr_reader :domain
  # @return [String] 
    attr_reader :username
  # @return [String] 
    attr_reader :realm
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param domain [String] 
    # @param username [String] 
    # @param realm [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SipTrunkOutboundSipRegisterPlan]
    def initialize(domain: OMIT, username: OMIT, realm: OMIT, additional_properties: nil)
      @domain = domain if domain != OMIT
      @username = username if username != OMIT
      @realm = realm if realm != OMIT
      @additional_properties = additional_properties
      @_field_set = { "domain": domain, "username": username, "realm": realm }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SipTrunkOutboundSipRegisterPlan
    #
    # @param json_object [String] 
    # @return [Vapi::SipTrunkOutboundSipRegisterPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      domain = parsed_json["domain"]
      username = parsed_json["username"]
      realm = parsed_json["realm"]
      new(
        domain: domain,
        username: username,
        realm: realm,
        additional_properties: struct
      )
    end
# Serialize an instance of SipTrunkOutboundSipRegisterPlan to a JSON object
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
      obj.domain&.is_a?(String) != false || raise("Passed value for field obj.domain is not the expected type, validation failed.")
      obj.username&.is_a?(String) != false || raise("Passed value for field obj.username is not the expected type, validation failed.")
      obj.realm&.is_a?(String) != false || raise("Passed value for field obj.realm is not the expected type, validation failed.")
    end
  end
end