# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class CreateLangfuseCredentialDto
    # @return [String]
    attr_reader :provider
    # @return [String] The public key for Langfuse project. Eg: pk-lf-...
    attr_reader :public_key
    # @return [String] The secret key for Langfuse project. Eg: sk-lf-... .This is not returned in the
    #  API.
    attr_reader :api_key
    # @return [String] The host URL for Langfuse project. Eg: https://cloud.langfuse.com
    attr_reader :api_url
    # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String]
    # @param public_key [String] The public key for Langfuse project. Eg: pk-lf-...
    # @param api_key [String] The secret key for Langfuse project. Eg: sk-lf-... .This is not returned in the
    #  API.
    # @param api_url [String] The host URL for Langfuse project. Eg: https://cloud.langfuse.com
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateLangfuseCredentialDto]
    def initialize(provider:, public_key:, api_key:, api_url:, name: OMIT, additional_properties: nil)
      @provider = provider
      @public_key = public_key
      @api_key = api_key
      @api_url = api_url
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "provider": provider,
        "publicKey": public_key,
        "apiKey": api_key,
        "apiUrl": api_url,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateLangfuseCredentialDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateLangfuseCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      public_key = parsed_json["publicKey"]
      api_key = parsed_json["apiKey"]
      api_url = parsed_json["apiUrl"]
      name = parsed_json["name"]
      new(
        provider: provider,
        public_key: public_key,
        api_key: api_key,
        api_url: api_url,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateLangfuseCredentialDto to a JSON object
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
      obj.public_key.is_a?(String) != false || raise("Passed value for field obj.public_key is not the expected type, validation failed.")
      obj.api_key.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
      obj.api_url.is_a?(String) != false || raise("Passed value for field obj.api_url is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
