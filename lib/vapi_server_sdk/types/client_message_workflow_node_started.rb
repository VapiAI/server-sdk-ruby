# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ClientMessageWorkflowNodeStarted
    # @return [String] This is the type of the message. "workflow.node.started" is sent when the active
    #  node changes.
    attr_reader :type
    # @return [Hash{String => Object}] This is the active node.
    attr_reader :node
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of the message. "workflow.node.started" is sent when the active
    #  node changes.
    # @param node [Hash{String => Object}] This is the active node.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageWorkflowNodeStarted]
    def initialize(type:, node:, additional_properties: nil)
      @type = type
      @node = node
      @additional_properties = additional_properties
      @_field_set = { "type": type, "node": node }
    end

    # Deserialize a JSON object to an instance of ClientMessageWorkflowNodeStarted
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageWorkflowNodeStarted]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      node = parsed_json["node"]
      new(
        type: type,
        node: node,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageWorkflowNodeStarted to a JSON object
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
      obj.node.is_a?(Hash) != false || raise("Passed value for field obj.node is not the expected type, validation failed.")
    end
  end
end
