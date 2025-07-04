# frozen_string_literal: true

require_relative "mcp_tool_metadata_protocol"
require "ostruct"
require "json"

module Vapi
  class McpToolMetadata
    # @return [Vapi::McpToolMetadataProtocol] This is the protocol used for MCP communication. Defaults to Streamable HTTP.
    attr_reader :protocol
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param protocol [Vapi::McpToolMetadataProtocol] This is the protocol used for MCP communication. Defaults to Streamable HTTP.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::McpToolMetadata]
    def initialize(protocol: OMIT, additional_properties: nil)
      @protocol = protocol if protocol != OMIT
      @additional_properties = additional_properties
      @_field_set = { "protocol": protocol }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of McpToolMetadata
    #
    # @param json_object [String]
    # @return [Vapi::McpToolMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      protocol = parsed_json["protocol"]
      new(protocol: protocol, additional_properties: struct)
    end

    # Serialize an instance of McpToolMetadata to a JSON object
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
      obj.protocol&.is_a?(Vapi::McpToolMetadataProtocol) != false || raise("Passed value for field obj.protocol is not the expected type, validation failed.")
    end
  end
end
