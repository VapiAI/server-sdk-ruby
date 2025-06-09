# frozen_string_literal: true
require "json"
require_relative "anthropic_model"
require_relative "anyscale_model"
require_relative "cerebras_model"
require_relative "custom_llm_model"
require_relative "deep_infra_model"
require_relative "deep_seek_model"
require_relative "google_model"
require_relative "groq_model"
require_relative "inflection_ai_model"
require_relative "open_ai_model"
require_relative "open_router_model"
require_relative "perplexity_ai_model"
require_relative "together_ai_model"
require_relative "xai_model"

module Vapi
# These are the options for the assistant's LLM.
  class AssistantModel
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vapi::AssistantModel]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of AssistantModel
    #
    # @param json_object [String] 
    # @return [Vapi::AssistantModel]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.provider
      when "anthropic"
        member = Vapi::AnthropicModel.from_json(json_object: json_object)
      when "anyscale"
        member = Vapi::AnyscaleModel.from_json(json_object: json_object)
      when "cerebras"
        member = Vapi::CerebrasModel.from_json(json_object: json_object)
      when "custom-llm"
        member = Vapi::CustomLlmModel.from_json(json_object: json_object)
      when "deepinfra"
        member = Vapi::DeepInfraModel.from_json(json_object: json_object)
      when "deep-seek"
        member = Vapi::DeepSeekModel.from_json(json_object: json_object)
      when "google"
        member = Vapi::GoogleModel.from_json(json_object: json_object)
      when "groq"
        member = Vapi::GroqModel.from_json(json_object: json_object)
      when "inflection-ai"
        member = Vapi::InflectionAiModel.from_json(json_object: json_object)
      when "openai"
        member = Vapi::OpenAiModel.from_json(json_object: json_object)
      when "openrouter"
        member = Vapi::OpenRouterModel.from_json(json_object: json_object)
      when "perplexity-ai"
        member = Vapi::PerplexityAiModel.from_json(json_object: json_object)
      when "together-ai"
        member = Vapi::TogetherAiModel.from_json(json_object: json_object)
      when "xai"
        member = Vapi::XaiModel.from_json(json_object: json_object)
      else
        member = Vapi::AnthropicModel.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.provider)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "anthropic"
        { **@member.to_json, provider: @discriminant }.to_json
      when "anyscale"
        { **@member.to_json, provider: @discriminant }.to_json
      when "cerebras"
        { **@member.to_json, provider: @discriminant }.to_json
      when "custom-llm"
        { **@member.to_json, provider: @discriminant }.to_json
      when "deepinfra"
        { **@member.to_json, provider: @discriminant }.to_json
      when "deep-seek"
        { **@member.to_json, provider: @discriminant }.to_json
      when "google"
        { **@member.to_json, provider: @discriminant }.to_json
      when "groq"
        { **@member.to_json, provider: @discriminant }.to_json
      when "inflection-ai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "openai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "openrouter"
        { **@member.to_json, provider: @discriminant }.to_json
      when "perplexity-ai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "together-ai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "xai"
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
      when "anthropic"
        Vapi::AnthropicModel.validate_raw(obj: obj)
      when "anyscale"
        Vapi::AnyscaleModel.validate_raw(obj: obj)
      when "cerebras"
        Vapi::CerebrasModel.validate_raw(obj: obj)
      when "custom-llm"
        Vapi::CustomLlmModel.validate_raw(obj: obj)
      when "deepinfra"
        Vapi::DeepInfraModel.validate_raw(obj: obj)
      when "deep-seek"
        Vapi::DeepSeekModel.validate_raw(obj: obj)
      when "google"
        Vapi::GoogleModel.validate_raw(obj: obj)
      when "groq"
        Vapi::GroqModel.validate_raw(obj: obj)
      when "inflection-ai"
        Vapi::InflectionAiModel.validate_raw(obj: obj)
      when "openai"
        Vapi::OpenAiModel.validate_raw(obj: obj)
      when "openrouter"
        Vapi::OpenRouterModel.validate_raw(obj: obj)
      when "perplexity-ai"
        Vapi::PerplexityAiModel.validate_raw(obj: obj)
      when "together-ai"
        Vapi::TogetherAiModel.validate_raw(obj: obj)
      when "xai"
        Vapi::XaiModel.validate_raw(obj: obj)
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
    # @param member [Vapi::AnthropicModel] 
    # @return [Vapi::AssistantModel]
    def self.anthropic(member:)
      new(member: member, discriminant: "anthropic")
    end
    # @param member [Vapi::AnyscaleModel] 
    # @return [Vapi::AssistantModel]
    def self.anyscale(member:)
      new(member: member, discriminant: "anyscale")
    end
    # @param member [Vapi::CerebrasModel] 
    # @return [Vapi::AssistantModel]
    def self.cerebras(member:)
      new(member: member, discriminant: "cerebras")
    end
    # @param member [Vapi::CustomLlmModel] 
    # @return [Vapi::AssistantModel]
    def self.custom_llm(member:)
      new(member: member, discriminant: "custom-llm")
    end
    # @param member [Vapi::DeepInfraModel] 
    # @return [Vapi::AssistantModel]
    def self.deepinfra(member:)
      new(member: member, discriminant: "deepinfra")
    end
    # @param member [Vapi::DeepSeekModel] 
    # @return [Vapi::AssistantModel]
    def self.deep_seek(member:)
      new(member: member, discriminant: "deep-seek")
    end
    # @param member [Vapi::GoogleModel] 
    # @return [Vapi::AssistantModel]
    def self.google(member:)
      new(member: member, discriminant: "google")
    end
    # @param member [Vapi::GroqModel] 
    # @return [Vapi::AssistantModel]
    def self.groq(member:)
      new(member: member, discriminant: "groq")
    end
    # @param member [Vapi::InflectionAiModel] 
    # @return [Vapi::AssistantModel]
    def self.inflection_ai(member:)
      new(member: member, discriminant: "inflection-ai")
    end
    # @param member [Vapi::OpenAiModel] 
    # @return [Vapi::AssistantModel]
    def self.openai(member:)
      new(member: member, discriminant: "openai")
    end
    # @param member [Vapi::OpenRouterModel] 
    # @return [Vapi::AssistantModel]
    def self.openrouter(member:)
      new(member: member, discriminant: "openrouter")
    end
    # @param member [Vapi::PerplexityAiModel] 
    # @return [Vapi::AssistantModel]
    def self.perplexity_ai(member:)
      new(member: member, discriminant: "perplexity-ai")
    end
    # @param member [Vapi::TogetherAiModel] 
    # @return [Vapi::AssistantModel]
    def self.together_ai(member:)
      new(member: member, discriminant: "together-ai")
    end
    # @param member [Vapi::XaiModel] 
    # @return [Vapi::AssistantModel]
    def self.xai(member:)
      new(member: member, discriminant: "xai")
    end
  end
end