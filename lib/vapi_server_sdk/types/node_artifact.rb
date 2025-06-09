# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class NodeArtifact
  # @return [String] This is the node id.
    attr_reader :node_name
  # @return [Array<Hash{String => Object}>] This is the messages that were spoken during the node.
    attr_reader :messages
  # @return [Hash{String => Object}] This is the object containing the variables extracted from the node.
    attr_reader :variables
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param node_name [String] This is the node id.
    # @param messages [Array<Hash{String => Object}>] This is the messages that were spoken during the node.
    # @param variables [Hash{String => Object}] This is the object containing the variables extracted from the node.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::NodeArtifact]
    def initialize(node_name: OMIT, messages: OMIT, variables: OMIT, additional_properties: nil)
      @node_name = node_name if node_name != OMIT
      @messages = messages if messages != OMIT
      @variables = variables if variables != OMIT
      @additional_properties = additional_properties
      @_field_set = { "nodeName": node_name, "messages": messages, "variables": variables }.reject do | _k, v |
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
      node_name = parsed_json["nodeName"]
      messages = parsed_json["messages"]
      variables = parsed_json["variables"]
      new(
        node_name: node_name,
        messages: messages,
        variables: variables,
        additional_properties: struct
      )
    end
# Serialize an instance of NodeArtifact to a JSON object
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
      obj.node_name&.is_a?(String) != false || raise("Passed value for field obj.node_name is not the expected type, validation failed.")
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.variables&.is_a?(Hash) != false || raise("Passed value for field obj.variables is not the expected type, validation failed.")
    end
  end
end