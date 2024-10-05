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
      # Deserialize a JSON object to an instance of UpdateAssistantDtoModel
      #
      # @param json_object [String]
      # @return [Vapi::Assistants::UpdateAssistantDtoModel]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::AnyscaleModel.validate_raw(obj: struct)
          return Vapi::AnyscaleModel.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::AnthropicModel.validate_raw(obj: struct)
          return Vapi::AnthropicModel.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::CustomLlmModel.validate_raw(obj: struct)
          return Vapi::CustomLlmModel.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::DeepInfraModel.validate_raw(obj: struct)
          return Vapi::DeepInfraModel.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::GroqModel.validate_raw(obj: struct)
          return Vapi::GroqModel.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::OpenAiModel.validate_raw(obj: struct)
          return Vapi::OpenAiModel.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::OpenRouterModel.validate_raw(obj: struct)
          return Vapi::OpenRouterModel.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::PerplexityAiModel.validate_raw(obj: struct)
          return Vapi::PerplexityAiModel.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::TogetherAiModel.validate_raw(obj: struct)
          return Vapi::TogetherAiModel.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::VapiModel.validate_raw(obj: struct)
          return Vapi::VapiModel.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Vapi::AnyscaleModel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::AnthropicModel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::CustomLlmModel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::DeepInfraModel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::GroqModel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::OpenAiModel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::OpenRouterModel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::PerplexityAiModel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::TogetherAiModel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::VapiModel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
