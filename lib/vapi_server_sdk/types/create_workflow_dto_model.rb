# frozen_string_literal: true

require "json"
require_relative "workflow_open_ai_model"
require_relative "workflow_anthropic_model"
require_relative "workflow_google_model"
require_relative "workflow_custom_model"

module Vapi
  # This is the model for the workflow.
  #  This can be overridden at node level using `nodes[n].model`.
  class CreateWorkflowDtoModel
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::CreateWorkflowDtoModel]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of CreateWorkflowDtoModel
    #
    # @param json_object [String]
    # @return [Vapi::CreateWorkflowDtoModel]
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
    # @return [Vapi::CreateWorkflowDtoModel]
    def self.openai(member:)
      new(member: member, discriminant: "openai")
    end

    # @param member [Vapi::WorkflowAnthropicModel]
    # @return [Vapi::CreateWorkflowDtoModel]
    def self.anthropic(member:)
      new(member: member, discriminant: "anthropic")
    end

    # @param member [Vapi::WorkflowGoogleModel]
    # @return [Vapi::CreateWorkflowDtoModel]
    def self.google(member:)
      new(member: member, discriminant: "google")
    end

    # @param member [Vapi::WorkflowCustomModel]
    # @return [Vapi::CreateWorkflowDtoModel]
    def self.custom_llm(member:)
      new(member: member, discriminant: "custom-llm")
    end
  end
end
