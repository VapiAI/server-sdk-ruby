# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class ToolCallFunction
  # @return [String] This is the arguments to call the function with
    attr_reader :arguments
  # @return [String] This is the name of the function to call
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param arguments [String] This is the arguments to call the function with
    # @param name [String] This is the name of the function to call
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolCallFunction]
    def initialize(arguments:, name:, additional_properties: nil)
      @arguments = arguments
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "arguments": arguments, "name": name }
    end
# Deserialize a JSON object to an instance of ToolCallFunction
    #
    # @param json_object [String] 
    # @return [Vapi::ToolCallFunction]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      arguments = parsed_json["arguments"]
      name = parsed_json["name"]
      new(
        arguments: arguments,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of ToolCallFunction to a JSON object
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
      obj.arguments.is_a?(String) != false || raise("Passed value for field obj.arguments is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end