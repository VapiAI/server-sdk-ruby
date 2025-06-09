# frozen_string_literal: true
require_relative "o_auth_2_authentication_plan"
require "ostruct"
require "json"

module Vapi
  class UpdateCustomLlmCredentialDto
  # @return [String] This is not returned in the API.
    attr_reader :api_key
  # @return [Vapi::OAuth2AuthenticationPlan] This is the authentication plan. Currently supports OAuth2 RFC 6749. To use
#  Bearer authentication, use apiKey
    attr_reader :authentication_plan
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param api_key [String] This is not returned in the API.
    # @param authentication_plan [Vapi::OAuth2AuthenticationPlan] This is the authentication plan. Currently supports OAuth2 RFC 6749. To use
#  Bearer authentication, use apiKey
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateCustomLlmCredentialDto]
    def initialize(api_key: OMIT, authentication_plan: OMIT, name: OMIT, additional_properties: nil)
      @api_key = api_key if api_key != OMIT
      @authentication_plan = authentication_plan if authentication_plan != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "apiKey": api_key, "authenticationPlan": authentication_plan, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateCustomLlmCredentialDto
    #
    # @param json_object [String] 
    # @return [Vapi::UpdateCustomLlmCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      api_key = parsed_json["apiKey"]
      unless parsed_json["authenticationPlan"].nil?
        authentication_plan = parsed_json["authenticationPlan"].to_json
        authentication_plan = Vapi::OAuth2AuthenticationPlan.from_json(json_object: authentication_plan)
      else
        authentication_plan = nil
      end
      name = parsed_json["name"]
      new(
        api_key: api_key,
        authentication_plan: authentication_plan,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateCustomLlmCredentialDto to a JSON object
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
      obj.api_key&.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
      obj.authentication_plan.nil? || Vapi::OAuth2AuthenticationPlan.validate_raw(obj: obj.authentication_plan)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end