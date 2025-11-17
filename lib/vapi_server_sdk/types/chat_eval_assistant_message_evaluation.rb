# frozen_string_literal: true

require_relative "chat_eval_assistant_message_evaluation_role"
require_relative "chat_eval_assistant_message_evaluation_judge_plan"
require_relative "assistant_message_evaluation_continue_plan"
require "ostruct"
require "json"

module Vapi
  class ChatEvalAssistantMessageEvaluation
    # @return [Vapi::ChatEvalAssistantMessageEvaluationRole] This is the role of the message author.
    #  For an assistant message evaluation, the role is always 'assistant'
    #  @default 'assistant'
    attr_reader :role
    # @return [Vapi::ChatEvalAssistantMessageEvaluationJudgePlan] This is the judge plan that instructs how to evaluate the assistant message.
    #  The assistant message can be evaluated against fixed content (exact match or
    #  RegEx) or with an LLM-as-judge by defining the evaluation criteria in a prompt.
    attr_reader :judge_plan
    # @return [Vapi::AssistantMessageEvaluationContinuePlan] This is the plan for how the overall evaluation will proceed after the assistant
    #  message is evaluated.
    #  This lets you configure whether to stop the evaluation if this message fails,
    #  and whether to override any content for future turns
    attr_reader :continue_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [Vapi::ChatEvalAssistantMessageEvaluationRole] This is the role of the message author.
    #  For an assistant message evaluation, the role is always 'assistant'
    #  @default 'assistant'
    # @param judge_plan [Vapi::ChatEvalAssistantMessageEvaluationJudgePlan] This is the judge plan that instructs how to evaluate the assistant message.
    #  The assistant message can be evaluated against fixed content (exact match or
    #  RegEx) or with an LLM-as-judge by defining the evaluation criteria in a prompt.
    # @param continue_plan [Vapi::AssistantMessageEvaluationContinuePlan] This is the plan for how the overall evaluation will proceed after the assistant
    #  message is evaluated.
    #  This lets you configure whether to stop the evaluation if this message fails,
    #  and whether to override any content for future turns
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChatEvalAssistantMessageEvaluation]
    def initialize(role:, judge_plan:, continue_plan: OMIT, additional_properties: nil)
      @role = role
      @judge_plan = judge_plan
      @continue_plan = continue_plan if continue_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "role": role, "judgePlan": judge_plan, "continuePlan": continue_plan }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ChatEvalAssistantMessageEvaluation
    #
    # @param json_object [String]
    # @return [Vapi::ChatEvalAssistantMessageEvaluation]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      if parsed_json["judgePlan"].nil?
        judge_plan = nil
      else
        judge_plan = parsed_json["judgePlan"].to_json
        judge_plan = Vapi::ChatEvalAssistantMessageEvaluationJudgePlan.from_json(json_object: judge_plan)
      end
      if parsed_json["continuePlan"].nil?
        continue_plan = nil
      else
        continue_plan = parsed_json["continuePlan"].to_json
        continue_plan = Vapi::AssistantMessageEvaluationContinuePlan.from_json(json_object: continue_plan)
      end
      new(
        role: role,
        judge_plan: judge_plan,
        continue_plan: continue_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of ChatEvalAssistantMessageEvaluation to a JSON object
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
      obj.role.is_a?(Vapi::ChatEvalAssistantMessageEvaluationRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      Vapi::ChatEvalAssistantMessageEvaluationJudgePlan.validate_raw(obj: obj.judge_plan)
      obj.continue_plan.nil? || Vapi::AssistantMessageEvaluationContinuePlan.validate_raw(obj: obj.continue_plan)
    end
  end
end
