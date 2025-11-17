# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ChatEvalAssistantMessageMockToolCall
    # @return [String] This is the name of the tool that will be called.
    #  It should be one of the tools created in the organization.
    attr_reader :name
    # @return [Hash{String => Object}] This is the arguments that will be passed to the tool call.
    attr_reader :arguments
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the tool that will be called.
    #  It should be one of the tools created in the organization.
    # @param arguments [Hash{String => Object}] This is the arguments that will be passed to the tool call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChatEvalAssistantMessageMockToolCall]
    def initialize(name:, arguments: OMIT, additional_properties: nil)
      @name = name
      @arguments = arguments if arguments != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "arguments": arguments }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ChatEvalAssistantMessageMockToolCall
    #
    # @param json_object [String]
    # @return [Vapi::ChatEvalAssistantMessageMockToolCall]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      arguments = parsed_json["arguments"]
      new(
        name: name,
        arguments: arguments,
        additional_properties: struct
      )
    end

    # Serialize an instance of ChatEvalAssistantMessageMockToolCall to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.arguments&.is_a?(Hash) != false || raise("Passed value for field obj.arguments is not the expected type, validation failed.")
    end
  end
end
