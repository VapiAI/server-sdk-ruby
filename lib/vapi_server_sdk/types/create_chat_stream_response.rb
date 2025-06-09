# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class CreateChatStreamResponse
  # @return [String] This is the unique identifier for the streaming response.
    attr_reader :id
  # @return [String] This is the path to the content being updated.
#  Format: `chat.output[{contentIndex}].content` where contentIndex identifies the
#  specific content item.
    attr_reader :path
  # @return [String] This is the incremental content chunk being streamed.
    attr_reader :delta
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] This is the unique identifier for the streaming response.
    # @param path [String] This is the path to the content being updated.
#  Format: `chat.output[{contentIndex}].content` where contentIndex identifies the
#  specific content item.
    # @param delta [String] This is the incremental content chunk being streamed.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateChatStreamResponse]
    def initialize(id:, path:, delta:, additional_properties: nil)
      @id = id
      @path = path
      @delta = delta
      @additional_properties = additional_properties
      @_field_set = { "id": id, "path": path, "delta": delta }
    end
# Deserialize a JSON object to an instance of CreateChatStreamResponse
    #
    # @param json_object [String] 
    # @return [Vapi::CreateChatStreamResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      path = parsed_json["path"]
      delta = parsed_json["delta"]
      new(
        id: id,
        path: path,
        delta: delta,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateChatStreamResponse to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.path.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
      obj.delta.is_a?(String) != false || raise("Passed value for field obj.delta is not the expected type, validation failed.")
    end
  end
end