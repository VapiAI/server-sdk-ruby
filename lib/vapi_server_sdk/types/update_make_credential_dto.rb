# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class UpdateMakeCredentialDto
    # @return [String]
    attr_reader :provider
    # @return [String] Team ID
    attr_reader :team_id
    # @return [String] Region of your application. For example: eu1, eu2, us1, us2
    attr_reader :region
    # @return [String] This is not returned in the API.
    attr_reader :api_key
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String]
    # @param team_id [String] Team ID
    # @param region [String] Region of your application. For example: eu1, eu2, us1, us2
    # @param api_key [String] This is not returned in the API.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateMakeCredentialDto]
    def initialize(provider:, team_id:, region:, api_key:, additional_properties: nil)
      @provider = provider
      @team_id = team_id
      @region = region
      @api_key = api_key
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "teamId": team_id, "region": region, "apiKey": api_key }
    end

    # Deserialize a JSON object to an instance of UpdateMakeCredentialDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateMakeCredentialDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      team_id = parsed_json["teamId"]
      region = parsed_json["region"]
      api_key = parsed_json["apiKey"]
      new(
        provider: provider,
        team_id: team_id,
        region: region,
        api_key: api_key,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateMakeCredentialDto to a JSON object
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
      obj.team_id.is_a?(String) != false || raise("Passed value for field obj.team_id is not the expected type, validation failed.")
      obj.region.is_a?(String) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.api_key.is_a?(String) != false || raise("Passed value for field obj.api_key is not the expected type, validation failed.")
    end
  end
end
