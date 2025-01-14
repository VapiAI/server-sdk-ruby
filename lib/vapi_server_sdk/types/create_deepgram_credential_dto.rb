# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class CreateDeepgramCredentialDto
    # @return [String] This is not returned in the API.
    attr_reader :api_key
    # @return [String] This can be used to point to an onprem Deepgram instance. Defaults to
    #  api.deepgram.com.
    attr_reader :api_url
    # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param api_key [String] This is not returned in the API.
    # @param api_url [String] This can be used to point to an onprem Deepgram instance. Defaults to
    #  api.deepgram.com.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateDeepgramCredentialDto]
    def initialize(api_key:, api_url: OMIT, name: OMIT, additional_properties: nil)
      @api_key = api_key
      @api_url = api_url if api_url != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "apiKey": api_key, "apiUrl": api_url, "name": name }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateDeepgramCredentialDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateDeepgramCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      api_key = parsed_json["apiKey"]
      api_url = parsed_json["apiUrl"]
      name = parsed_json["name"]
      new(
        api_key: api_key,
        api_url: api_url,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateDeepgramCredentialDto to a JSON object
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
      obj.api_key.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
      obj.api_url&.is_a?(String) != false || raise("Passed value for field obj.api_url is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
