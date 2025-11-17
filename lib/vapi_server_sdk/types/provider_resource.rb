# frozen_string_literal: true

require "date"
require_relative "provider_resource_provider"
require_relative "provider_resource_resource_name"
require_relative "eleven_labs_pronunciation_dictionary"
require "ostruct"
require "json"

module Vapi
  class ProviderResource
    # @return [String] This is the unique identifier for the provider resource.
    attr_reader :id
    # @return [String] This is the unique identifier for the org that this provider resource belongs
    #  to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the provider resource was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the provider resource was last
    #  updated.
    attr_reader :updated_at
    # @return [Vapi::ProviderResourceProvider] This is the provider that manages this resource.
    attr_reader :provider
    # @return [Vapi::ProviderResourceResourceName] This is the name/type of the resource.
    attr_reader :resource_name
    # @return [String] This is the provider-specific identifier for the resource.
    attr_reader :resource_id
    # @return [Vapi::ElevenLabsPronunciationDictionary] This is the full resource data from the provider's API.
    attr_reader :resource
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] This is the unique identifier for the provider resource.
    # @param org_id [String] This is the unique identifier for the org that this provider resource belongs
    #  to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the provider resource was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the provider resource was last
    #  updated.
    # @param provider [Vapi::ProviderResourceProvider] This is the provider that manages this resource.
    # @param resource_name [Vapi::ProviderResourceResourceName] This is the name/type of the resource.
    # @param resource_id [String] This is the provider-specific identifier for the resource.
    # @param resource [Vapi::ElevenLabsPronunciationDictionary] This is the full resource data from the provider's API.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ProviderResource]
    def initialize(id:, org_id:, created_at:, updated_at:, provider:, resource_name:, resource_id:, resource:,
                   additional_properties: nil)
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @provider = provider
      @resource_name = resource_name
      @resource_id = resource_id
      @resource = resource
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "provider": provider,
        "resourceName": resource_name,
        "resourceId": resource_id,
        "resource": resource
      }
    end

    # Deserialize a JSON object to an instance of ProviderResource
    #
    # @param json_object [String]
    # @return [Vapi::ProviderResource]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      provider = parsed_json["provider"]
      resource_name = parsed_json["resourceName"]
      resource_id = parsed_json["resourceId"]
      if parsed_json["resource"].nil?
        resource = nil
      else
        resource = parsed_json["resource"].to_json
        resource = Vapi::ElevenLabsPronunciationDictionary.from_json(json_object: resource)
      end
      new(
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        provider: provider,
        resource_name: resource_name,
        resource_id: resource_id,
        resource: resource,
        additional_properties: struct
      )
    end

    # Serialize an instance of ProviderResource to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.provider.is_a?(Vapi::ProviderResourceProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.resource_name.is_a?(Vapi::ProviderResourceResourceName) != false || raise("Passed value for field obj.resource_name is not the expected type, validation failed.")
      obj.resource_id.is_a?(String) != false || raise("Passed value for field obj.resource_id is not the expected type, validation failed.")
      Vapi::ElevenLabsPronunciationDictionary.validate_raw(obj: obj.resource)
    end
  end
end
