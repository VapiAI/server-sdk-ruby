# frozen_string_literal: true
require_relative "tool_call_function"
require "ostruct"
require "json"

module Vapi
  class ToolCall
  # @return [String] This is the ID of the tool call
    attr_reader :id
  # @return [String] This is the type of tool
    attr_reader :type
  # @return [Vapi::ToolCallFunction] This is the function that was called
    attr_reader :function
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] This is the ID of the tool call
    # @param type [String] This is the type of tool
    # @param function [Vapi::ToolCallFunction] This is the function that was called
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolCall]
    def initialize(id:, type:, function:, additional_properties: nil)
      @id = id
      @type = type
      @function = function
      @additional_properties = additional_properties
      @_field_set = { "id": id, "type": type, "function": function }
    end
# Deserialize a JSON object to an instance of ToolCall
    #
    # @param json_object [String] 
    # @return [Vapi::ToolCall]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      unless parsed_json["function"].nil?
        function = parsed_json["function"].to_json
        function = Vapi::ToolCallFunction.from_json(json_object: function)
      else
        function = nil
      end
      new(
        id: id,
        type: type,
        function: function,
        additional_properties: struct
      )
    end
# Serialize an instance of ToolCall to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Vapi::ToolCallFunction.validate_raw(obj: obj.function)
    end
  end
end