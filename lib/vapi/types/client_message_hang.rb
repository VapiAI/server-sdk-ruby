# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ClientMessageHang
    # @return [String] This is the type of the message. "hang" is sent when the assistant is hanging
    #  due to a delay. The delay can be caused by many factors, such as:
    #  - the model is too slow to respond
    #  - the voice is too slow to respond
    #  - the tool call is still waiting for a response from your server
    #  - etc.
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of the message. "hang" is sent when the assistant is hanging
    #  due to a delay. The delay can be caused by many factors, such as:
    #  - the model is too slow to respond
    #  - the voice is too slow to respond
    #  - the tool call is still waiting for a response from your server
    #  - etc.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageHang]
    def initialize(type:, additional_properties: nil)
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "type": type }
    end

    # Deserialize a JSON object to an instance of ClientMessageHang
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageHang]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      new(type: type, additional_properties: struct)
    end

    # Serialize an instance of ClientMessageHang to a JSON object
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
    end
  end
end
