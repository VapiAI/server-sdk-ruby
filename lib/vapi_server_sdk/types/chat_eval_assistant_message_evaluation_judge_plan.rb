# frozen_string_literal: true

require "json"
require_relative "assistant_message_judge_plan_exact"
require_relative "assistant_message_judge_plan_regex"
require_relative "assistant_message_judge_plan_ai"

module Vapi
  # This is the judge plan that instructs how to evaluate the assistant message.
  #  The assistant message can be evaluated against fixed content (exact match or
  #  RegEx) or with an LLM-as-judge by defining the evaluation criteria in a prompt.
  class ChatEvalAssistantMessageEvaluationJudgePlan
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::ChatEvalAssistantMessageEvaluationJudgePlan]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of
    #  ChatEvalAssistantMessageEvaluationJudgePlan
    #
    # @param json_object [String]
    # @return [Vapi::ChatEvalAssistantMessageEvaluationJudgePlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "exact"
                 Vapi::AssistantMessageJudgePlanExact.from_json(json_object: json_object)
               when "regex"
                 Vapi::AssistantMessageJudgePlanRegex.from_json(json_object: json_object)
               when "ai"
                 Vapi::AssistantMessageJudgePlanAi.from_json(json_object: json_object)
               else
                 Vapi::AssistantMessageJudgePlanExact.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "exact"
        { **@member.to_json, type: @discriminant }.to_json
      when "regex"
        { **@member.to_json, type: @discriminant }.to_json
      when "ai"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "exact"
        Vapi::AssistantMessageJudgePlanExact.validate_raw(obj: obj)
      when "regex"
        Vapi::AssistantMessageJudgePlanRegex.validate_raw(obj: obj)
      when "ai"
        Vapi::AssistantMessageJudgePlanAi.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end

    # For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object]
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end

    # @param member [Vapi::AssistantMessageJudgePlanExact]
    # @return [Vapi::ChatEvalAssistantMessageEvaluationJudgePlan]
    def self.exact(member:)
      new(member: member, discriminant: "exact")
    end

    # @param member [Vapi::AssistantMessageJudgePlanRegex]
    # @return [Vapi::ChatEvalAssistantMessageEvaluationJudgePlan]
    def self.regex(member:)
      new(member: member, discriminant: "regex")
    end

    # @param member [Vapi::AssistantMessageJudgePlanAi]
    # @return [Vapi::ChatEvalAssistantMessageEvaluationJudgePlan]
    def self.ai(member:)
      new(member: member, discriminant: "ai")
    end
  end
end
