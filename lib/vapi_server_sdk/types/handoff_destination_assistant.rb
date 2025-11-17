# frozen_string_literal: true

require_relative "handoff_destination_assistant_type"
require_relative "handoff_destination_assistant_context_engineering_plan"
require_relative "create_assistant_dto"
require_relative "variable_extraction_plan"
require_relative "assistant_overrides"
require "ostruct"
require "json"

module Vapi
  class HandoffDestinationAssistant
    # @return [Vapi::HandoffDestinationAssistantType]
    attr_reader :type
    # @return [Vapi::HandoffDestinationAssistantContextEngineeringPlan] This is the plan for manipulating the message context before handing off the
    #  call to the next assistant.
    attr_reader :context_engineering_plan
    # @return [String] This is the assistant to transfer the call to. You must provide either
    #  assistantName or assistantId.
    attr_reader :assistant_name
    # @return [String] This is the assistant id to transfer the call to. You must provide either
    #  assistantName or assistantId.
    attr_reader :assistant_id
    # @return [Vapi::CreateAssistantDto] This is a transient assistant to transfer the call to. You may provide a
    #  transient assistant in the response  `handoff-destination-request` in a dynamic
    #  handoff.
    attr_reader :assistant
    # @return [Vapi::VariableExtractionPlan] This is the variable extraction plan for the handoff tool.
    attr_reader :variable_extraction_plan
    # @return [Vapi::AssistantOverrides] These are the assistant overrides to apply to the destination assistant.
    attr_reader :assistant_overrides
    # @return [String] This is the description of the destination, used by the AI to choose when and
    #  how to transfer the call.
    attr_reader :description
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::HandoffDestinationAssistantType]
    # @param context_engineering_plan [Vapi::HandoffDestinationAssistantContextEngineeringPlan] This is the plan for manipulating the message context before handing off the
    #  call to the next assistant.
    # @param assistant_name [String] This is the assistant to transfer the call to. You must provide either
    #  assistantName or assistantId.
    # @param assistant_id [String] This is the assistant id to transfer the call to. You must provide either
    #  assistantName or assistantId.
    # @param assistant [Vapi::CreateAssistantDto] This is a transient assistant to transfer the call to. You may provide a
    #  transient assistant in the response  `handoff-destination-request` in a dynamic
    #  handoff.
    # @param variable_extraction_plan [Vapi::VariableExtractionPlan] This is the variable extraction plan for the handoff tool.
    # @param assistant_overrides [Vapi::AssistantOverrides] These are the assistant overrides to apply to the destination assistant.
    # @param description [String] This is the description of the destination, used by the AI to choose when and
    #  how to transfer the call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::HandoffDestinationAssistant]
    def initialize(type:, context_engineering_plan: OMIT, assistant_name: OMIT, assistant_id: OMIT, assistant: OMIT,
                   variable_extraction_plan: OMIT, assistant_overrides: OMIT, description: OMIT, additional_properties: nil)
      @type = type
      @context_engineering_plan = context_engineering_plan if context_engineering_plan != OMIT
      @assistant_name = assistant_name if assistant_name != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @assistant = assistant if assistant != OMIT
      @variable_extraction_plan = variable_extraction_plan if variable_extraction_plan != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "type": type,
        "contextEngineeringPlan": context_engineering_plan,
        "assistantName": assistant_name,
        "assistantId": assistant_id,
        "assistant": assistant,
        "variableExtractionPlan": variable_extraction_plan,
        "assistantOverrides": assistant_overrides,
        "description": description
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of HandoffDestinationAssistant
    #
    # @param json_object [String]
    # @return [Vapi::HandoffDestinationAssistant]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      if parsed_json["contextEngineeringPlan"].nil?
        context_engineering_plan = nil
      else
        context_engineering_plan = parsed_json["contextEngineeringPlan"].to_json
        context_engineering_plan = Vapi::HandoffDestinationAssistantContextEngineeringPlan.from_json(json_object: context_engineering_plan)
      end
      assistant_name = parsed_json["assistantName"]
      assistant_id = parsed_json["assistantId"]
      if parsed_json["assistant"].nil?
        assistant = nil
      else
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      end
      if parsed_json["variableExtractionPlan"].nil?
        variable_extraction_plan = nil
      else
        variable_extraction_plan = parsed_json["variableExtractionPlan"].to_json
        variable_extraction_plan = Vapi::VariableExtractionPlan.from_json(json_object: variable_extraction_plan)
      end
      if parsed_json["assistantOverrides"].nil?
        assistant_overrides = nil
      else
        assistant_overrides = parsed_json["assistantOverrides"].to_json
        assistant_overrides = Vapi::AssistantOverrides.from_json(json_object: assistant_overrides)
      end
      description = parsed_json["description"]
      new(
        type: type,
        context_engineering_plan: context_engineering_plan,
        assistant_name: assistant_name,
        assistant_id: assistant_id,
        assistant: assistant,
        variable_extraction_plan: variable_extraction_plan,
        assistant_overrides: assistant_overrides,
        description: description,
        additional_properties: struct
      )
    end

    # Serialize an instance of HandoffDestinationAssistant to a JSON object
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
      obj.type.is_a?(Vapi::HandoffDestinationAssistantType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.context_engineering_plan.nil? || Vapi::HandoffDestinationAssistantContextEngineeringPlan.validate_raw(obj: obj.context_engineering_plan)
      obj.assistant_name&.is_a?(String) != false || raise("Passed value for field obj.assistant_name is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.variable_extraction_plan.nil? || Vapi::VariableExtractionPlan.validate_raw(obj: obj.variable_extraction_plan)
      obj.assistant_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.assistant_overrides)
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end
