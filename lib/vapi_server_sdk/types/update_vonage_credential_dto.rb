# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class UpdateVonageCredentialDto
  # @return [String] This is not returned in the API.
    attr_reader :api_secret
  # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
  # @return [String] 
    attr_reader :api_key
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param api_secret [String] This is not returned in the API.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param api_key [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateVonageCredentialDto]
    def initialize(api_secret: OMIT, name: OMIT, api_key: OMIT, additional_properties: nil)
      @api_secret = api_secret if api_secret != OMIT
      @name = name if name != OMIT
      @api_key = api_key if api_key != OMIT
      @additional_properties = additional_properties
      @_field_set = { "apiSecret": api_secret, "name": name, "apiKey": api_key }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateVonageCredentialDto
    #
    # @param json_object [String] 
    # @return [Vapi::UpdateVonageCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      api_secret = parsed_json["apiSecret"]
      name = parsed_json["name"]
      api_key = parsed_json["apiKey"]
      new(
        api_secret: api_secret,
        name: name,
        api_key: api_key,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateVonageCredentialDto to a JSON object
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
      obj.api_secret&.is_a?(String) != false || raise("Passed value for field obj.api_secret is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.api_key&.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
    end
  end
end