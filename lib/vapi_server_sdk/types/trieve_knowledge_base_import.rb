# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class TrieveKnowledgeBaseImport
    # @return [String] This is the `datasetId` of the dataset on your Trieve account.
    attr_reader :provider_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider_id [String] This is the `datasetId` of the dataset on your Trieve account.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TrieveKnowledgeBaseImport]
    def initialize(provider_id:, additional_properties: nil)
      @provider_id = provider_id
      @additional_properties = additional_properties
      @_field_set = { "providerId": provider_id }
    end

    # Deserialize a JSON object to an instance of TrieveKnowledgeBaseImport
    #
    # @param json_object [String]
    # @return [Vapi::TrieveKnowledgeBaseImport]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider_id = parsed_json["providerId"]
      new(provider_id: provider_id, additional_properties: struct)
    end

    # Serialize an instance of TrieveKnowledgeBaseImport to a JSON object
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
      obj.provider_id.is_a?(String) != false || raise("Passed value for field obj.provider_id is not the expected type, validation failed.")
    end
  end
end
