# frozen_string_literal: true

require_relative "create_azure_credential_dto_region"
require "ostruct"
require "json"

module Vapi
  class CreateAzureCredentialDto
    # @return [String]
    attr_reader :provider
    # @return [String] This is the service being used in Azure.
    attr_reader :service
    # @return [Vapi::CreateAzureCredentialDtoRegion] This is the region of the Azure resource.
    attr_reader :region
    # @return [String] This is not returned in the API.
    attr_reader :api_key
    # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String]
    # @param service [String] This is the service being used in Azure.
    # @param region [Vapi::CreateAzureCredentialDtoRegion] This is the region of the Azure resource.
    # @param api_key [String] This is not returned in the API.
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateAzureCredentialDto]
    def initialize(provider:, service:, region: OMIT, api_key: OMIT, name: OMIT, additional_properties: nil)
      @provider = provider
      @service = service
      @region = region if region != OMIT
      @api_key = api_key if api_key != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "provider": provider,
        "service": service,
        "region": region,
        "apiKey": api_key,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateAzureCredentialDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateAzureCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      service = parsed_json["service"]
      region = parsed_json["region"]
      api_key = parsed_json["apiKey"]
      name = parsed_json["name"]
      new(
        provider: provider,
        service: service,
        region: region,
        api_key: api_key,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateAzureCredentialDto to a JSON object
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
      obj.service.is_a?(String) != false || raise("Passed value for field obj.service is not the expected type, validation failed.")
      obj.region&.is_a?(Vapi::CreateAzureCredentialDtoRegion) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.api_key&.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end