# frozen_string_literal: true

require_relative "node_artifact_messages_item"
require "ostruct"
require "json"

module Vapi
  class NodeArtifact
    # @return [Array<Vapi::NodeArtifactMessagesItem>] These are the messages that were spoken during the node.
    attr_reader :messages
    # @return [String] This is the node name.
    attr_reader :node_name
    # @return [Hash{String => Object}] These are the variable values that were extracted from the node.
    attr_reader :variable_values
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::NodeArtifactMessagesItem>] These are the messages that were spoken during the node.
    # @param node_name [String] This is the node name.
    # @param variable_values [Hash{String => Object}] These are the variable values that were extracted from the node.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::NodeArtifact]
    def initialize(messages: OMIT, node_name: OMIT, variable_values: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @node_name = node_name if node_name != OMIT
      @variable_values = variable_values if variable_values != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "nodeName": node_name,
        "variableValues": variable_values
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of NodeArtifact
    #
    # @param json_object [String]
    # @return [Vapi::NodeArtifact]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::NodeArtifactMessagesItem.from_json(json_object: item)
      end
      node_name = parsed_json["nodeName"]
      variable_values = parsed_json["variableValues"]
      new(
        messages: messages,
        node_name: node_name,
        variable_values: variable_values,
        additional_properties: struct
      )
    end

    # Serialize an instance of NodeArtifact to a JSON object
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
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.node_name&.is_a?(String) != false || raise("Passed value for field obj.node_name is not the expected type, validation failed.")
      obj.variable_values&.is_a?(Hash) != false || raise("Passed value for field obj.variable_values is not the expected type, validation failed.")
    end
  end
end
