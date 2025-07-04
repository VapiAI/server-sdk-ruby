# frozen_string_literal: true

require_relative "workflow_open_ai_model_model"
require "ostruct"
require "json"

module Vapi
  class WorkflowOpenAiModel
    # @return [Vapi::WorkflowOpenAiModelModel] This is the OpenAI model that will be used.
    #  When using Vapi OpenAI or your own Azure Credentials, you have the option to
    #  specify the region for the selected model. This shouldn't be specified unless
    #  you have a specific reason to do so. Vapi will automatically find the fastest
    #  region that make sense.
    #  This is helpful when you are required to comply with Data Residency rules. Learn
    #  more about Azure regions here
    #  https://azure.microsoft.com/en-us/explore/global-infrastructure/data-residency/.
    attr_reader :model
    # @return [Float] This is the temperature of the model.
    attr_reader :temperature
    # @return [Float] This is the max tokens of the model.
    attr_reader :max_tokens
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [Vapi::WorkflowOpenAiModelModel] This is the OpenAI model that will be used.
    #  When using Vapi OpenAI or your own Azure Credentials, you have the option to
    #  specify the region for the selected model. This shouldn't be specified unless
    #  you have a specific reason to do so. Vapi will automatically find the fastest
    #  region that make sense.
    #  This is helpful when you are required to comply with Data Residency rules. Learn
    #  more about Azure regions here
    #  https://azure.microsoft.com/en-us/explore/global-infrastructure/data-residency/.
    # @param temperature [Float] This is the temperature of the model.
    # @param max_tokens [Float] This is the max tokens of the model.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::WorkflowOpenAiModel]
    def initialize(model:, temperature: OMIT, max_tokens: OMIT, additional_properties: nil)
      @model = model
      @temperature = temperature if temperature != OMIT
      @max_tokens = max_tokens if max_tokens != OMIT
      @additional_properties = additional_properties
      @_field_set = { "model": model, "temperature": temperature, "maxTokens": max_tokens }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of WorkflowOpenAiModel
    #
    # @param json_object [String]
    # @return [Vapi::WorkflowOpenAiModel]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model = parsed_json["model"]
      temperature = parsed_json["temperature"]
      max_tokens = parsed_json["maxTokens"]
      new(
        model: model,
        temperature: temperature,
        max_tokens: max_tokens,
        additional_properties: struct
      )
    end

    # Serialize an instance of WorkflowOpenAiModel to a JSON object
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
      obj.model.is_a?(Vapi::WorkflowOpenAiModelModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.temperature&.is_a?(Float) != false || raise("Passed value for field obj.temperature is not the expected type, validation failed.")
      obj.max_tokens&.is_a?(Float) != false || raise("Passed value for field obj.max_tokens is not the expected type, validation failed.")
    end
  end
end
