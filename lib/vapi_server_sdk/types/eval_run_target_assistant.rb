# frozen_string_literal: true

require_relative "create_assistant_dto"
require_relative "assistant_overrides"
require "ostruct"
require "json"

module Vapi
  class EvalRunTargetAssistant
    # @return [Vapi::CreateAssistantDto] This is the transient assistant that will be run against the eval
    attr_reader :assistant
    # @return [Vapi::AssistantOverrides] This is the overrides that will be applied to the assistant.
    attr_reader :assistant_overrides
    # @return [String] This is the id of the assistant that will be run against the eval
    attr_reader :assistant_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param assistant [Vapi::CreateAssistantDto] This is the transient assistant that will be run against the eval
    # @param assistant_overrides [Vapi::AssistantOverrides] This is the overrides that will be applied to the assistant.
    # @param assistant_id [String] This is the id of the assistant that will be run against the eval
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::EvalRunTargetAssistant]
    def initialize(assistant: OMIT, assistant_overrides: OMIT, assistant_id: OMIT, additional_properties: nil)
      @assistant = assistant if assistant != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "assistant": assistant,
        "assistantOverrides": assistant_overrides,
        "assistantId": assistant_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of EvalRunTargetAssistant
    #
    # @param json_object [String]
    # @return [Vapi::EvalRunTargetAssistant]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
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
      assistant_id = parsed_json["assistantId"]
      new(
        assistant: assistant,
        assistant_overrides: assistant_overrides,
        assistant_id: assistant_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of EvalRunTargetAssistant to a JSON object
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
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.assistant_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.assistant_overrides)
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
    end
  end
end
