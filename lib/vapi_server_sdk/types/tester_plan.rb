# frozen_string_literal: true

require_relative "create_assistant_dto"
require_relative "assistant_overrides"
require "ostruct"
require "json"

module Vapi
  class TesterPlan
    # @return [Vapi::CreateAssistantDto] Pass a transient assistant to use for the test assistant.
    #  Make sure to write a detailed system prompt for a test assistant, and use the
    #  {{test.script}} variable to access the test script.
    attr_reader :assistant
    # @return [String] Pass an assistant id that can be access
    #  Make sure to write a detailed system prompt for the test assistant, and use the
    #  {{test.script}} variable to access the test script.
    attr_reader :assistant_id
    # @return [Vapi::AssistantOverrides] Add any assistant overrides to the test assistant.
    #  One use case is if you want to pass custom variables into the test using
    #  variableValues, that you can then access in the script
    #  and rubric using {{varName}}.
    attr_reader :assistant_overrides
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param assistant [Vapi::CreateAssistantDto] Pass a transient assistant to use for the test assistant.
    #  Make sure to write a detailed system prompt for a test assistant, and use the
    #  {{test.script}} variable to access the test script.
    # @param assistant_id [String] Pass an assistant id that can be access
    #  Make sure to write a detailed system prompt for the test assistant, and use the
    #  {{test.script}} variable to access the test script.
    # @param assistant_overrides [Vapi::AssistantOverrides] Add any assistant overrides to the test assistant.
    #  One use case is if you want to pass custom variables into the test using
    #  variableValues, that you can then access in the script
    #  and rubric using {{varName}}.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TesterPlan]
    def initialize(assistant: OMIT, assistant_id: OMIT, assistant_overrides: OMIT, additional_properties: nil)
      @assistant = assistant if assistant != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "assistant": assistant,
        "assistantId": assistant_id,
        "assistantOverrides": assistant_overrides
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TesterPlan
    #
    # @param json_object [String]
    # @return [Vapi::TesterPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["assistant"].nil?
        assistant = nil
      else
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      end
      assistant_id = parsed_json["assistantId"]
      if parsed_json["assistantOverrides"].nil?
        assistant_overrides = nil
      else
        assistant_overrides = parsed_json["assistantOverrides"].to_json
        assistant_overrides = Vapi::AssistantOverrides.from_json(json_object: assistant_overrides)
      end
      new(
        assistant: assistant,
        assistant_id: assistant_id,
        assistant_overrides: assistant_overrides,
        additional_properties: struct
      )
    end

    # Serialize an instance of TesterPlan to a JSON object
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
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.assistant_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.assistant_overrides)
    end
  end
end
