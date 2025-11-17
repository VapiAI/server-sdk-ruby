# frozen_string_literal: true

require_relative "chat_eval_tool_response_message_evaluation_role"
require_relative "assistant_message_judge_plan_ai"
require "ostruct"
require "json"

module Vapi
  class ChatEvalToolResponseMessageEvaluation
    # @return [Vapi::ChatEvalToolResponseMessageEvaluationRole] This is the role of the message author.
    #  For a tool response message evaluation, the role is always 'tool'
    #  @default 'tool'
    attr_reader :role
    # @return [Vapi::AssistantMessageJudgePlanAi] This is the judge plan that instructs how to evaluate the tool response message.
    #  The tool response message can be evaluated with an LLM-as-judge by defining the
    #  evaluation criteria in a prompt.
    attr_reader :judge_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [Vapi::ChatEvalToolResponseMessageEvaluationRole] This is the role of the message author.
    #  For a tool response message evaluation, the role is always 'tool'
    #  @default 'tool'
    # @param judge_plan [Vapi::AssistantMessageJudgePlanAi] This is the judge plan that instructs how to evaluate the tool response message.
    #  The tool response message can be evaluated with an LLM-as-judge by defining the
    #  evaluation criteria in a prompt.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChatEvalToolResponseMessageEvaluation]
    def initialize(role:, judge_plan:, additional_properties: nil)
      @role = role
      @judge_plan = judge_plan
      @additional_properties = additional_properties
      @_field_set = { "role": role, "judgePlan": judge_plan }
    end

    # Deserialize a JSON object to an instance of
    #  ChatEvalToolResponseMessageEvaluation
    #
    # @param json_object [String]
    # @return [Vapi::ChatEvalToolResponseMessageEvaluation]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      if parsed_json["judgePlan"].nil?
        judge_plan = nil
      else
        judge_plan = parsed_json["judgePlan"].to_json
        judge_plan = Vapi::AssistantMessageJudgePlanAi.from_json(json_object: judge_plan)
      end
      new(
        role: role,
        judge_plan: judge_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of ChatEvalToolResponseMessageEvaluation to a JSON object
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
      obj.role.is_a?(Vapi::ChatEvalToolResponseMessageEvaluationRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      Vapi::AssistantMessageJudgePlanAi.validate_raw(obj: obj.judge_plan)
    end
  end
end
