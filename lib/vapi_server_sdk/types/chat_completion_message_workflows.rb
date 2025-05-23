# frozen_string_literal: true

require_relative "chat_completion_message_metadata"
require "ostruct"
require "json"

module Vapi
  class ChatCompletionMessageWorkflows
    # @return [Hash{String => Object}]
    attr_reader :role
    # @return [String]
    attr_reader :content
    # @return [Vapi::ChatCompletionMessageMetadata]
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [Hash{String => Object}]
    # @param content [String]
    # @param metadata [Vapi::ChatCompletionMessageMetadata]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChatCompletionMessageWorkflows]
    def initialize(role:, content: OMIT, metadata: OMIT, additional_properties: nil)
      @role = role
      @content = content if content != OMIT
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "role": role, "content": content, "metadata": metadata }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ChatCompletionMessageWorkflows
    #
    # @param json_object [String]
    # @return [Vapi::ChatCompletionMessageWorkflows]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      content = parsed_json["content"]
      if parsed_json["metadata"].nil?
        metadata = nil
      else
        metadata = parsed_json["metadata"].to_json
        metadata = Vapi::ChatCompletionMessageMetadata.from_json(json_object: metadata)
      end
      new(
        role: role,
        content: content,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of ChatCompletionMessageWorkflows to a JSON object
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
      obj.role.is_a?(Hash) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.metadata.nil? || Vapi::ChatCompletionMessageMetadata.validate_raw(obj: obj.metadata)
    end
  end
end
