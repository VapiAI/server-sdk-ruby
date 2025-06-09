# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class TrieveKnowledgeBaseImport
  # @return [String] This is to import an existing dataset from Trieve.
    attr_reader :type
  # @return [String] This is the `datasetId` of the dataset on your Trieve account.
    attr_reader :provider_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is to import an existing dataset from Trieve.
    # @param provider_id [String] This is the `datasetId` of the dataset on your Trieve account.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TrieveKnowledgeBaseImport]
    def initialize(type:, provider_id:, additional_properties: nil)
      @type = type
      @provider_id = provider_id
      @additional_properties = additional_properties
      @_field_set = { "type": type, "providerId": provider_id }
    end
# Deserialize a JSON object to an instance of TrieveKnowledgeBaseImport
    #
    # @param json_object [String] 
    # @return [Vapi::TrieveKnowledgeBaseImport]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      provider_id = parsed_json["providerId"]
      new(
        type: type,
        provider_id: provider_id,
        additional_properties: struct
      )
    end
# Serialize an instance of TrieveKnowledgeBaseImport to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.provider_id.is_a?(String) != false || raise("Passed value for field obj.provider_id is not the expected type, validation failed.")
    end
  end
end