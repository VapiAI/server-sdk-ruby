# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ClientMessageMetadata
    # @return [String] This is the type of the message. "metadata" is sent to forward metadata to the
    #  client.
    attr_reader :type
    # @return [String] This is the metadata content
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of the message. "metadata" is sent to forward metadata to the
    #  client.
    # @param metadata [String] This is the metadata content
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageMetadata]
    def initialize(type:, metadata:, additional_properties: nil)
      @type = type
      @metadata = metadata
      @additional_properties = additional_properties
      @_field_set = { "type": type, "metadata": metadata }
    end

    # Deserialize a JSON object to an instance of ClientMessageMetadata
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      metadata = parsed_json["metadata"]
      new(
        type: type,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageMetadata to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.metadata.is_a?(String) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
