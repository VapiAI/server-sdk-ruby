# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class AssistantUserEditable
    # @return [Object]
    attr_reader :server_messages
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param server_messages [Object]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssistantUserEditable]
    def initialize(server_messages: OMIT, additional_properties: nil)
      @server_messages = server_messages if server_messages != OMIT
      @additional_properties = additional_properties
      @_field_set = { "serverMessages": server_messages }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AssistantUserEditable
    #
    # @param json_object [String]
    # @return [Vapi::AssistantUserEditable]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      server_messages = parsed_json["serverMessages"]
      new(server_messages: server_messages, additional_properties: struct)
    end

    # Serialize an instance of AssistantUserEditable to a JSON object
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
      obj.server_messages&.is_a?(Object) != false || raise("Passed value for field obj.server_messages is not the expected type, validation failed.")
    end
  end
end
