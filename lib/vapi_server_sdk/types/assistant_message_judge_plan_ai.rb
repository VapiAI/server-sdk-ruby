# frozen_string_literal: true

require_relative "assistant_message_judge_plan_ai_model"
require_relative "assistant_message_judge_plan_ai_type"
require "ostruct"
require "json"

module Vapi
  class AssistantMessageJudgePlanAi
    # @return [Vapi::AssistantMessageJudgePlanAiModel] This is the model to use for the LLM-as-a-judge.
    #  If not provided, will default to the assistant's model.
    #  The instructions on how to evaluate the model output with this LLM-Judge must be
    #  passed as a system message in the messages array of the model.
    #  The Mock conversation can be passed to the LLM-Judge to evaluate using the
    #  prompt {{messages}} and will be evaluated as a LiquidJS Variable. To access and
    #  judge only the last message, use {{messages[-1]}}
    #  The LLM-Judge must respond with "pass" or "fail" and only those two responses
    #  are allowed.
    attr_reader :model
    # @return [Vapi::AssistantMessageJudgePlanAiType] This is the type of the judge plan.
    #  Use 'ai' to evaluate the assistant message content using LLM-as-a-judge.
    #  @default 'ai'
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [Vapi::AssistantMessageJudgePlanAiModel] This is the model to use for the LLM-as-a-judge.
    #  If not provided, will default to the assistant's model.
    #  The instructions on how to evaluate the model output with this LLM-Judge must be
    #  passed as a system message in the messages array of the model.
    #  The Mock conversation can be passed to the LLM-Judge to evaluate using the
    #  prompt {{messages}} and will be evaluated as a LiquidJS Variable. To access and
    #  judge only the last message, use {{messages[-1]}}
    #  The LLM-Judge must respond with "pass" or "fail" and only those two responses
    #  are allowed.
    # @param type [Vapi::AssistantMessageJudgePlanAiType] This is the type of the judge plan.
    #  Use 'ai' to evaluate the assistant message content using LLM-as-a-judge.
    #  @default 'ai'
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssistantMessageJudgePlanAi]
    def initialize(model:, type:, additional_properties: nil)
      @model = model
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "model": model, "type": type }
    end

    # Deserialize a JSON object to an instance of AssistantMessageJudgePlanAi
    #
    # @param json_object [String]
    # @return [Vapi::AssistantMessageJudgePlanAi]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["model"].nil?
        model = nil
      else
        model = parsed_json["model"].to_json
        model = Vapi::AssistantMessageJudgePlanAiModel.from_json(json_object: model)
      end
      type = parsed_json["type"]
      new(
        model: model,
        type: type,
        additional_properties: struct
      )
    end

    # Serialize an instance of AssistantMessageJudgePlanAi to a JSON object
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
      Vapi::AssistantMessageJudgePlanAiModel.validate_raw(obj: obj.model)
      obj.type.is_a?(Vapi::AssistantMessageJudgePlanAiType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
