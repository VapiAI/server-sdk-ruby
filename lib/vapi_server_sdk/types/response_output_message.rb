# frozen_string_literal: true

require_relative "response_output_text"
require_relative "response_output_message_role"
require_relative "response_output_message_status"
require_relative "response_output_message_type"
require "ostruct"
require "json"

module Vapi
  class ResponseOutputMessage
    # @return [String] The unique ID of the output message
    attr_reader :id
    # @return [Array<Vapi::ResponseOutputText>] Content of the output message
    attr_reader :content
    # @return [Vapi::ResponseOutputMessageRole] The role of the output message
    attr_reader :role
    # @return [Vapi::ResponseOutputMessageStatus] The status of the message
    attr_reader :status
    # @return [Vapi::ResponseOutputMessageType] The type of the output message
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique ID of the output message
    # @param content [Array<Vapi::ResponseOutputText>] Content of the output message
    # @param role [Vapi::ResponseOutputMessageRole] The role of the output message
    # @param status [Vapi::ResponseOutputMessageStatus] The status of the message
    # @param type [Vapi::ResponseOutputMessageType] The type of the output message
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ResponseOutputMessage]
    def initialize(id:, content:, role:, status:, type:, additional_properties: nil)
      @id = id
      @content = content
      @role = role
      @status = status
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "content": content, "role": role, "status": status, "type": type }
    end

    # Deserialize a JSON object to an instance of ResponseOutputMessage
    #
    # @param json_object [String]
    # @return [Vapi::ResponseOutputMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      content = parsed_json["content"]&.map do |item|
        item = item.to_json
        Vapi::ResponseOutputText.from_json(json_object: item)
      end
      role = parsed_json["role"]
      status = parsed_json["status"]
      type = parsed_json["type"]
      new(
        id: id,
        content: content,
        role: role,
        status: status,
        type: type,
        additional_properties: struct
      )
    end

    # Serialize an instance of ResponseOutputMessage to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.content.is_a?(Array) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.role.is_a?(Vapi::ResponseOutputMessageRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.status.is_a?(Vapi::ResponseOutputMessageStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.type.is_a?(Vapi::ResponseOutputMessageType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
