# frozen_string_literal: true

require_relative "success_evaluation_plan_rubric"
require "ostruct"
require "json"

module Vapi
  class SuccessEvaluationPlan
    # @return [Vapi::SuccessEvaluationPlanRubric] This enforces the rubric of the evaluation. The output is stored in
    #  `call.analysis.successEvaluation`.
    #  Options include:
    #  - 'NumericScale': A scale of 1 to 10.
    #  - 'DescriptiveScale': A scale of Excellent, Good, Fair, Poor.
    #  - 'Checklist': A checklist of criteria and their status.
    #  - 'Matrix': A grid that evaluates multiple criteria across different performance
    #  levels.
    #  - 'PercentageScale': A scale of 0% to 100%.
    #  - 'LikertScale': A scale of Strongly Agree, Agree, Neutral, Disagree, Strongly
    #  Disagree.
    #  - 'AutomaticRubric': Automatically break down evaluation into several criteria,
    #  each with its own score.
    #  - 'PassFail': A simple 'true' if call passed, 'false' if not.
    #  Default is 'PassFail'.
    attr_reader :rubric
    # @return [Array<Hash{String => Object}>] These are the messages used to generate the success evaluation.
    #  @default: ```
    #  [
    #  {
    #  "role": "system",
    #  "content": "You are an expert call evaluator. You will be given a transcript
    #  of a call and the system prompt of the AI participant. Determine if the call was
    #  successful based on the objectives inferred from the system prompt. DO NOT
    #  return anything except the result.\n\nRubric:\\n{{rubric}}\n\nOnly respond with
    #  the result."
    #  },
    #  {
    #  "role": "user",
    #  "content": "Here is the transcript:\n\n{{transcript}}\n\n"
    #  },
    #  {
    #  "role": "user",
    #  "content": "Here was the system prompt of the call:\n\n{{systemPrompt}}\n\n.
    #  Here is the ended reason of the call:\n\n{{endedReason}}\n\n"
    #  }
    #  ]```
    #  You can customize by providing any messages you want.
    #  Here are the template variables available:
    #  - {{transcript}}: the transcript of the call from `call.artifact.transcript`-
    #  {{systemPrompt}}: the system prompt of the call from
    #  `assistant.model.messages[type=system].content`- {{rubric}}: the rubric of the
    #  success evaluation from `successEvaluationPlan.rubric`- {{endedReason}}: the
    #  ended reason of the call from `call.endedReason`
    attr_reader :messages
    # @return [Boolean] This determines whether a success evaluation is generated and stored in
    #  `call.analysis.successEvaluation`. Defaults to true.
    #  Usage:
    #  - If you want to disable the success evaluation, set this to false.
    #  @default true
    attr_reader :enabled
    # @return [Float] This is how long the request is tried before giving up. When request times out,
    #  `call.analysis.successEvaluation` will be empty.
    #  Usage:
    #  - To guarantee the success evaluation is generated, set this value high. Note,
    #  this will delay the end of call report in cases where model is slow to respond.
    #  @default 5 seconds
    attr_reader :timeout_seconds
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param rubric [Vapi::SuccessEvaluationPlanRubric] This enforces the rubric of the evaluation. The output is stored in
    #  `call.analysis.successEvaluation`.
    #  Options include:
    #  - 'NumericScale': A scale of 1 to 10.
    #  - 'DescriptiveScale': A scale of Excellent, Good, Fair, Poor.
    #  - 'Checklist': A checklist of criteria and their status.
    #  - 'Matrix': A grid that evaluates multiple criteria across different performance
    #  levels.
    #  - 'PercentageScale': A scale of 0% to 100%.
    #  - 'LikertScale': A scale of Strongly Agree, Agree, Neutral, Disagree, Strongly
    #  Disagree.
    #  - 'AutomaticRubric': Automatically break down evaluation into several criteria,
    #  each with its own score.
    #  - 'PassFail': A simple 'true' if call passed, 'false' if not.
    #  Default is 'PassFail'.
    # @param messages [Array<Hash{String => Object}>] These are the messages used to generate the success evaluation.
    #  @default: ```
    #  [
    #  {
    #  "role": "system",
    #  "content": "You are an expert call evaluator. You will be given a transcript
    #  of a call and the system prompt of the AI participant. Determine if the call was
    #  successful based on the objectives inferred from the system prompt. DO NOT
    #  return anything except the result.\n\nRubric:\\n{{rubric}}\n\nOnly respond with
    #  the result."
    #  },
    #  {
    #  "role": "user",
    #  "content": "Here is the transcript:\n\n{{transcript}}\n\n"
    #  },
    #  {
    #  "role": "user",
    #  "content": "Here was the system prompt of the call:\n\n{{systemPrompt}}\n\n.
    #  Here is the ended reason of the call:\n\n{{endedReason}}\n\n"
    #  }
    #  ]```
    #  You can customize by providing any messages you want.
    #  Here are the template variables available:
    #  - {{transcript}}: the transcript of the call from `call.artifact.transcript`-
    #  {{systemPrompt}}: the system prompt of the call from
    #  `assistant.model.messages[type=system].content`- {{rubric}}: the rubric of the
    #  success evaluation from `successEvaluationPlan.rubric`- {{endedReason}}: the
    #  ended reason of the call from `call.endedReason`
    # @param enabled [Boolean] This determines whether a success evaluation is generated and stored in
    #  `call.analysis.successEvaluation`. Defaults to true.
    #  Usage:
    #  - If you want to disable the success evaluation, set this to false.
    #  @default true
    # @param timeout_seconds [Float] This is how long the request is tried before giving up. When request times out,
    #  `call.analysis.successEvaluation` will be empty.
    #  Usage:
    #  - To guarantee the success evaluation is generated, set this value high. Note,
    #  this will delay the end of call report in cases where model is slow to respond.
    #  @default 5 seconds
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SuccessEvaluationPlan]
    def initialize(rubric: OMIT, messages: OMIT, enabled: OMIT, timeout_seconds: OMIT, additional_properties: nil)
      @rubric = rubric if rubric != OMIT
      @messages = messages if messages != OMIT
      @enabled = enabled if enabled != OMIT
      @timeout_seconds = timeout_seconds if timeout_seconds != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "rubric": rubric,
        "messages": messages,
        "enabled": enabled,
        "timeoutSeconds": timeout_seconds
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SuccessEvaluationPlan
    #
    # @param json_object [String]
    # @return [Vapi::SuccessEvaluationPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      rubric = parsed_json["rubric"]
      messages = parsed_json["messages"]
      enabled = parsed_json["enabled"]
      timeout_seconds = parsed_json["timeoutSeconds"]
      new(
        rubric: rubric,
        messages: messages,
        enabled: enabled,
        timeout_seconds: timeout_seconds,
        additional_properties: struct
      )
    end

    # Serialize an instance of SuccessEvaluationPlan to a JSON object
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
      obj.rubric&.is_a?(Vapi::SuccessEvaluationPlanRubric) != false || raise("Passed value for field obj.rubric is not the expected type, validation failed.")
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
    end
  end
end
