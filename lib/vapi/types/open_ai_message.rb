# frozen_string_literal: true

require_relative "open_ai_message_role"
require "ostruct"
require "json"

module Vapi
  class OpenAiMessage
    # @return [String]
    attr_reader :content
    # @return [Vapi::OpenAiMessageRole]
    attr_reader :role
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param content [String]
    # @param role [Vapi::OpenAiMessageRole]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::OpenAiMessage]
    def initialize(role:, content: OMIT, additional_properties: nil)
      @content = content if content != OMIT
      @role = role
      @additional_properties = additional_properties
      @_field_set = { "content": content, "role": role }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of OpenAiMessage
    #
    # @param json_object [String]
    # @return [Vapi::OpenAiMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      content = parsed_json["content"]
      role = parsed_json["role"]
      new(
        content: content,
        role: role,
        additional_properties: struct
      )
    end

    # Serialize an instance of OpenAiMessage to a JSON object
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
      obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.role.is_a?(Vapi::OpenAiMessageRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
    end
  end
end
