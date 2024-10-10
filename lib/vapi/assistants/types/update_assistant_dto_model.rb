# frozen_string_literal: true

require "json"
require_relative "../../types/anyscale_model"
require_relative "../../types/anthropic_model"
require_relative "../../types/custom_llm_model"
require_relative "../../types/deep_infra_model"
require_relative "../../types/groq_model"
require_relative "../../types/open_ai_model"
require_relative "../../types/open_router_model"
require_relative "../../types/perplexity_ai_model"
require_relative "../../types/together_ai_model"
require_relative "../../types/vapi_model"

module Vapi
  class Assistants
    # These are the options for the assistant's LLM.
    class UpdateAssistantDtoModel
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of UpdateAssistantDtoModel
      #
      # @param json_object [String]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.provider
                 when "anyscale"
                   Vapi::AnyscaleModel.from_json(json_object: json_object)
                 when "anthropic"
                   Vapi::AnthropicModel.from_json(json_object: json_object)
                 when "custom-llm"
                   Vapi::CustomLlmModel.from_json(json_object: json_object)
                 when "deepinfra"
                   Vapi::DeepInfraModel.from_json(json_object: json_object)
                 when "groq"
                   Vapi::GroqModel.from_json(json_object: json_object)
                 when "openai"
                   Vapi::OpenAiModel.from_json(json_object: json_object)
                 when "openrouter"
                   Vapi::OpenRouterModel.from_json(json_object: json_object)
                 when "perplexity-ai"
                   Vapi::PerplexityAiModel.from_json(json_object: json_object)
                 when "together-ai"
                   Vapi::TogetherAiModel.from_json(json_object: json_object)
                 when "vapi"
                   Vapi::VapiModel.from_json(json_object: json_object)
                 else
                   Vapi::AnyscaleModel.from_json(json_object: json_object)
                 end
        new(member: member, discriminant: struct.provider)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [String]
      def to_json(*_args)
        case @discriminant
        when "anyscale"
          { **@member.to_json, provider: @discriminant }.to_json
        when "anthropic"
          { **@member.to_json, provider: @discriminant }.to_json
        when "custom-llm"
          { **@member.to_json, provider: @discriminant }.to_json
        when "deepinfra"
          { **@member.to_json, provider: @discriminant }.to_json
        when "groq"
          { **@member.to_json, provider: @discriminant }.to_json
        when "openai"
          { **@member.to_json, provider: @discriminant }.to_json
        when "openrouter"
          { **@member.to_json, provider: @discriminant }.to_json
        when "perplexity-ai"
          { **@member.to_json, provider: @discriminant }.to_json
        when "together-ai"
          { **@member.to_json, provider: @discriminant }.to_json
        when "vapi"
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
        when "anyscale"
          Vapi::AnyscaleModel.validate_raw(obj: obj)
        when "anthropic"
          Vapi::AnthropicModel.validate_raw(obj: obj)
        when "custom-llm"
          Vapi::CustomLlmModel.validate_raw(obj: obj)
        when "deepinfra"
          Vapi::DeepInfraModel.validate_raw(obj: obj)
        when "groq"
          Vapi::GroqModel.validate_raw(obj: obj)
        when "openai"
          Vapi::OpenAiModel.validate_raw(obj: obj)
        when "openrouter"
          Vapi::OpenRouterModel.validate_raw(obj: obj)
        when "perplexity-ai"
          Vapi::PerplexityAiModel.validate_raw(obj: obj)
        when "together-ai"
          Vapi::TogetherAiModel.validate_raw(obj: obj)
        when "vapi"
          Vapi::VapiModel.validate_raw(obj: obj)
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

      # @param member [Vapi::AnyscaleModel]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.anyscale(member:)
        new(member: member, discriminant: "anyscale")
      end

      # @param member [Vapi::AnthropicModel]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.anthropic(member:)
        new(member: member, discriminant: "anthropic")
      end

      # @param member [Vapi::CustomLlmModel]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.custom_llm(member:)
        new(member: member, discriminant: "custom-llm")
      end

      # @param member [Vapi::DeepInfraModel]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.deepinfra(member:)
        new(member: member, discriminant: "deepinfra")
      end

      # @param member [Vapi::GroqModel]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.groq(member:)
        new(member: member, discriminant: "groq")
      end

      # @param member [Vapi::OpenAiModel]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.openai(member:)
        new(member: member, discriminant: "openai")
      end

      # @param member [Vapi::OpenRouterModel]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.openrouter(member:)
        new(member: member, discriminant: "openrouter")
      end

      # @param member [Vapi::PerplexityAiModel]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.perplexity_ai(member:)
        new(member: member, discriminant: "perplexity-ai")
      end

      # @param member [Vapi::TogetherAiModel]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.together_ai(member:)
        new(member: member, discriminant: "together-ai")
      end

      # @param member [Vapi::VapiModel]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.vapi(member:)
        new(member: member, discriminant: "vapi")
      end
    end
  end
end
