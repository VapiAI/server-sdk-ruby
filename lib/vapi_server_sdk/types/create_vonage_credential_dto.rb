# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class CreateVonageCredentialDto
    # @return [String]
    attr_reader :provider
    # @return [String] This is not returned in the API.
    attr_reader :api_secret
    # @return [String]
    attr_reader :api_key
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String]
    # @param api_secret [String] This is not returned in the API.
    # @param api_key [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateVonageCredentialDto]
    def initialize(provider:, api_secret:, api_key:, additional_properties: nil)
      @provider = provider
      @api_secret = api_secret
      @api_key = api_key
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "apiSecret": api_secret, "apiKey": api_key }
    end

    # Deserialize a JSON object to an instance of CreateVonageCredentialDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateVonageCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      api_secret = parsed_json["apiSecret"]
      api_key = parsed_json["apiKey"]
      new(
        provider: provider,
        api_secret: api_secret,
        api_key: api_key,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateVonageCredentialDto to a JSON object
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
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.api_secret.is_a?(String) != false || raise("Passed value for field obj.api_secret is not the expected type, validation failed.")
      obj.api_key.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
    end
  end
end
