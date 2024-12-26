# frozen_string_literal: true

require_relative "update_azure_open_ai_credential_dto_region"
require_relative "update_azure_open_ai_credential_dto_models_item"
require "ostruct"
require "json"

module Vapi
  class UpdateAzureOpenAiCredentialDto
    # @return [String]
    attr_reader :provider
    # @return [Vapi::UpdateAzureOpenAiCredentialDtoRegion]
    attr_reader :region
    # @return [Array<Vapi::UpdateAzureOpenAiCredentialDtoModelsItem>]
    attr_reader :models
    # @return [String] This is not returned in the API.
    attr_reader :open_ai_key
    # @return [String]
    attr_reader :open_ai_endpoint
    # @return [String] This is the name of credential. This is just for your reference.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String]
    # @param region [Vapi::UpdateAzureOpenAiCredentialDtoRegion]
    # @param models [Array<Vapi::UpdateAzureOpenAiCredentialDtoModelsItem>]
    # @param open_ai_key [String] This is not returned in the API.
    # @param open_ai_endpoint [String]
    # @param name [String] This is the name of credential. This is just for your reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateAzureOpenAiCredentialDto]
    def initialize(provider:, region:, models:, open_ai_key:, open_ai_endpoint:, name: OMIT, additional_properties: nil)
      @provider = provider
      @region = region
      @models = models
      @open_ai_key = open_ai_key
      @open_ai_endpoint = open_ai_endpoint
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "provider": provider,
        "region": region,
        "models": models,
        "openAIKey": open_ai_key,
        "openAIEndpoint": open_ai_endpoint,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateAzureOpenAiCredentialDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateAzureOpenAiCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      region = parsed_json["region"]
      models = parsed_json["models"]
      open_ai_key = parsed_json["openAIKey"]
      open_ai_endpoint = parsed_json["openAIEndpoint"]
      name = parsed_json["name"]
      new(
        provider: provider,
        region: region,
        models: models,
        open_ai_key: open_ai_key,
        open_ai_endpoint: open_ai_endpoint,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateAzureOpenAiCredentialDto to a JSON object
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
      obj.region.is_a?(Vapi::UpdateAzureOpenAiCredentialDtoRegion) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.models.is_a?(Array) != false || raise("Passed value for field obj.models is not the expected type, validation failed.")
      obj.open_ai_key.is_a?(String) != false || raise("Passed value for field obj.open_ai_key is not the expected type, validation failed.")
      obj.open_ai_endpoint.is_a?(String) != false || raise("Passed value for field obj.open_ai_endpoint is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
