# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class ToolTemplateMetadata
  # @return [String] 
    attr_reader :collection_type
  # @return [String] 
    attr_reader :collection_id
  # @return [String] 
    attr_reader :collection_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param collection_type [String] 
    # @param collection_id [String] 
    # @param collection_name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolTemplateMetadata]
    def initialize(collection_type: OMIT, collection_id: OMIT, collection_name: OMIT, additional_properties: nil)
      @collection_type = collection_type if collection_type != OMIT
      @collection_id = collection_id if collection_id != OMIT
      @collection_name = collection_name if collection_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "collectionType": collection_type, "collectionId": collection_id, "collectionName": collection_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ToolTemplateMetadata
    #
    # @param json_object [String] 
    # @return [Vapi::ToolTemplateMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      collection_type = parsed_json["collectionType"]
      collection_id = parsed_json["collectionId"]
      collection_name = parsed_json["collectionName"]
      new(
        collection_type: collection_type,
        collection_id: collection_id,
        collection_name: collection_name,
        additional_properties: struct
      )
    end
# Serialize an instance of ToolTemplateMetadata to a JSON object
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
      obj.collection_type&.is_a?(String) != false || raise("Passed value for field obj.collection_type is not the expected type, validation failed.")
      obj.collection_id&.is_a?(String) != false || raise("Passed value for field obj.collection_id is not the expected type, validation failed.")
      obj.collection_name&.is_a?(String) != false || raise("Passed value for field obj.collection_name is not the expected type, validation failed.")
    end
  end
end