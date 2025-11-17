# frozen_string_literal: true

require_relative "chat_eval_user_message_mock_role"
require "ostruct"
require "json"

module Vapi
  class ChatEvalUserMessageMock
    # @return [Vapi::ChatEvalUserMessageMockRole] This is the role of the message author.
    #  For a mock user message, the role is always 'user'
    #  @default 'user'
    attr_reader :role
    # @return [String] This is the content of the user message.
    #  This is the message that the user would have sent.
    attr_reader :content
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [Vapi::ChatEvalUserMessageMockRole] This is the role of the message author.
    #  For a mock user message, the role is always 'user'
    #  @default 'user'
    # @param content [String] This is the content of the user message.
    #  This is the message that the user would have sent.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChatEvalUserMessageMock]
    def initialize(role:, content:, additional_properties: nil)
      @role = role
      @content = content
      @additional_properties = additional_properties
      @_field_set = { "role": role, "content": content }
    end

    # Deserialize a JSON object to an instance of ChatEvalUserMessageMock
    #
    # @param json_object [String]
    # @return [Vapi::ChatEvalUserMessageMock]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      content = parsed_json["content"]
      new(
        role: role,
        content: content,
        additional_properties: struct
      )
    end

    # Serialize an instance of ChatEvalUserMessageMock to a JSON object
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
      obj.role.is_a?(Vapi::ChatEvalUserMessageMockRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
    end
  end
end
