# frozen_string_literal: true

require_relative "open_ai_message"
require_relative "create_assistant_dto"
require_relative "assistant_overrides"
require "ostruct"
require "json"

module Vapi
  class ChatDto
    # @return [Array<Vapi::OpenAiMessage>]
    attr_reader :messages
    # @return [String]
    attr_reader :assistant_id
    # @return [Vapi::CreateAssistantDto]
    attr_reader :assistant
    # @return [Vapi::AssistantOverrides]
    attr_reader :assistant_overrides
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::OpenAiMessage>]
    # @param assistant_id [String]
    # @param assistant [Vapi::CreateAssistantDto]
    # @param assistant_overrides [Vapi::AssistantOverrides]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChatDto]
    def initialize(messages:, assistant_id: OMIT, assistant: OMIT, assistant_overrides: OMIT,
                   additional_properties: nil)
      @messages = messages
      @assistant_id = assistant_id if assistant_id != OMIT
      @assistant = assistant if assistant != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "assistantId": assistant_id,
        "assistant": assistant,
        "assistantOverrides": assistant_overrides
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ChatDto
    #
    # @param json_object [String]
    # @return [Vapi::ChatDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::OpenAiMessage.from_json(json_object: item)
      end
      assistant_id = parsed_json["assistantId"]
      if parsed_json["assistant"].nil?
        assistant = nil
      else
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      end
      if parsed_json["assistantOverrides"].nil?
        assistant_overrides = nil
      else
        assistant_overrides = parsed_json["assistantOverrides"].to_json
        assistant_overrides = Vapi::AssistantOverrides.from_json(json_object: assistant_overrides)
      end
      new(
        messages: messages,
        assistant_id: assistant_id,
        assistant: assistant,
        assistant_overrides: assistant_overrides,
        additional_properties: struct
      )
    end

    # Serialize an instance of ChatDto to a JSON object
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
      obj.messages.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.assistant_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.assistant_overrides)
    end
  end
end
