# frozen_string_literal: true

require "json"
require_relative "eval_open_ai_model"
require_relative "eval_anthropic_model"
require_relative "eval_google_model"
require_relative "eval_custom_model"

module Vapi
  # This is the model to use for the LLM-as-a-judge.
  #  If not provided, will default to the assistant's model.
  #  The instructions on how to evaluate the model output with this LLM-Judge must be
  #  passed as a system message in the messages array of the model.
  #  The Mock conversation can be passed to the LLM-Judge to evaluate using the
  #  prompt {{messages}} and will be evaluated as a LiquidJS Variable. To access and
  #  judge only the last message, use {{messages[-1]}}
  #  The LLM-Judge must respond with "pass" or "fail" and only those two responses
  #  are allowed.
  class AssistantMessageJudgePlanAiModel
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::AssistantMessageJudgePlanAiModel]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of AssistantMessageJudgePlanAiModel
    #
    # @param json_object [String]
    # @return [Vapi::AssistantMessageJudgePlanAiModel]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.provider
               when "openai"
                 Vapi::EvalOpenAiModel.from_json(json_object: json_object)
               when "anthropic"
                 Vapi::EvalAnthropicModel.from_json(json_object: json_object)
               when "google"
                 Vapi::EvalGoogleModel.from_json(json_object: json_object)
               when "custom-llm"
                 Vapi::EvalCustomModel.from_json(json_object: json_object)
               else
                 Vapi::EvalOpenAiModel.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.provider)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "openai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "anthropic"
        { **@member.to_json, provider: @discriminant }.to_json
      when "google"
        { **@member.to_json, provider: @discriminant }.to_json
      when "custom-llm"
        { **@member.to_json, provider: @discriminant }.to_json
      else
        { "provider": @discriminant, value: @member }.to_json
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
      case obj.provider
      when "openai"
        Vapi::EvalOpenAiModel.validate_raw(obj: obj)
      when "anthropic"
        Vapi::EvalAnthropicModel.validate_raw(obj: obj)
      when "google"
        Vapi::EvalGoogleModel.validate_raw(obj: obj)
      when "custom-llm"
        Vapi::EvalCustomModel.validate_raw(obj: obj)
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

    # @param member [Vapi::EvalOpenAiModel]
    # @return [Vapi::AssistantMessageJudgePlanAiModel]
    def self.openai(member:)
      new(member: member, discriminant: "openai")
    end

    # @param member [Vapi::EvalAnthropicModel]
    # @return [Vapi::AssistantMessageJudgePlanAiModel]
    def self.anthropic(member:)
      new(member: member, discriminant: "anthropic")
    end

    # @param member [Vapi::EvalGoogleModel]
    # @return [Vapi::AssistantMessageJudgePlanAiModel]
    def self.google(member:)
      new(member: member, discriminant: "google")
    end

    # @param member [Vapi::EvalCustomModel]
    # @return [Vapi::AssistantMessageJudgePlanAiModel]
    def self.custom_llm(member:)
      new(member: member, discriminant: "custom-llm")
    end
  end
end
