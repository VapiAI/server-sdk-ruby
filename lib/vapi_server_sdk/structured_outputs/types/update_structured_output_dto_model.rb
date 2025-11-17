# frozen_string_literal: true

require "json"
require_relative "../../types/workflow_open_ai_model"
require_relative "../../types/workflow_anthropic_model"
require_relative "../../types/workflow_google_model"
require_relative "../../types/workflow_custom_model"

module Vapi
  class StructuredOutputs
    # This is the model that will be used to extract the structured output.
    #  To provide your own custom system and user prompts for structured output
    #  extraction, populate the messages array with your system and user messages. You
    #  can specify liquid templating in your system and user messages.
    #  Between the system or user messages, you must reference either 'transcript' or
    #  'messages' with the '{{}}' syntax to access the conversation history.
    #  Between the system or user messages, you must reference a variation of the
    #  structured output with the '{{}}' syntax to access the structured output
    #  definition.
    #  i.e.:
    #  {{structuredOutput}}
    #  {{structuredOutput.name}}
    #  {{structuredOutput.description}}
    #  {{structuredOutput.schema}}
    #  If model is not specified, GPT-4.1 will be used by default for extraction,
    #  utilizing default system and user prompts.
    #  If messages or required fields are not specified, the default system and user
    #  prompts will be used.
    class UpdateStructuredOutputDtoModel
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::StructuredOutputs::UpdateStructuredOutputDtoModel]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of UpdateStructuredOutputDtoModel
      #
      # @param json_object [String]
      # @return [Vapi::StructuredOutputs::UpdateStructuredOutputDtoModel]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.provider
                 when "openai"
                   Vapi::WorkflowOpenAiModel.from_json(json_object: json_object)
                 when "anthropic"
                   Vapi::WorkflowAnthropicModel.from_json(json_object: json_object)
                 when "google"
                   Vapi::WorkflowGoogleModel.from_json(json_object: json_object)
                 when "custom-llm"
                   Vapi::WorkflowCustomModel.from_json(json_object: json_object)
                 else
                   Vapi::WorkflowOpenAiModel.from_json(json_object: json_object)
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
          Vapi::WorkflowOpenAiModel.validate_raw(obj: obj)
        when "anthropic"
          Vapi::WorkflowAnthropicModel.validate_raw(obj: obj)
        when "google"
          Vapi::WorkflowGoogleModel.validate_raw(obj: obj)
        when "custom-llm"
          Vapi::WorkflowCustomModel.validate_raw(obj: obj)
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

      # @param member [Vapi::WorkflowOpenAiModel]
      # @return [Vapi::StructuredOutputs::UpdateStructuredOutputDtoModel]
      def self.openai(member:)
        new(member: member, discriminant: "openai")
      end

      # @param member [Vapi::WorkflowAnthropicModel]
      # @return [Vapi::StructuredOutputs::UpdateStructuredOutputDtoModel]
      def self.anthropic(member:)
        new(member: member, discriminant: "anthropic")
      end

      # @param member [Vapi::WorkflowGoogleModel]
      # @return [Vapi::StructuredOutputs::UpdateStructuredOutputDtoModel]
      def self.google(member:)
        new(member: member, discriminant: "google")
      end

      # @param member [Vapi::WorkflowCustomModel]
      # @return [Vapi::StructuredOutputs::UpdateStructuredOutputDtoModel]
      def self.custom_llm(member:)
        new(member: member, discriminant: "custom-llm")
      end
    end
  end
end
