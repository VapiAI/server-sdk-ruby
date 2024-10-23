# frozen_string_literal: true

require_relative "analysis_cost_analysis_type"
require "ostruct"
require "json"

module Vapi
  class AnalysisCost
    # @return [Vapi::AnalysisCostAnalysisType] This is the type of analysis performed.
    attr_reader :analysis_type
    # @return [Hash{String => Object}] This is the model that was used to perform the analysis.
    attr_reader :model
    # @return [Float] This is the number of prompt tokens used in the analysis.
    attr_reader :prompt_tokens
    # @return [Float] This is the number of completion tokens generated in the analysis.
    attr_reader :completion_tokens
    # @return [Float] This is the cost of the component in USD.
    attr_reader :cost
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param analysis_type [Vapi::AnalysisCostAnalysisType] This is the type of analysis performed.
    # @param model [Hash{String => Object}] This is the model that was used to perform the analysis.
    # @param prompt_tokens [Float] This is the number of prompt tokens used in the analysis.
    # @param completion_tokens [Float] This is the number of completion tokens generated in the analysis.
    # @param cost [Float] This is the cost of the component in USD.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AnalysisCost]
    def initialize(analysis_type:, model:, prompt_tokens:, completion_tokens:, cost:, additional_properties: nil)
      @analysis_type = analysis_type
      @model = model
      @prompt_tokens = prompt_tokens
      @completion_tokens = completion_tokens
      @cost = cost
      @additional_properties = additional_properties
      @_field_set = {
        "analysisType": analysis_type,
        "model": model,
        "promptTokens": prompt_tokens,
        "completionTokens": completion_tokens,
        "cost": cost
      }
    end

    # Deserialize a JSON object to an instance of AnalysisCost
    #
    # @param json_object [String]
    # @return [Vapi::AnalysisCost]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      analysis_type = parsed_json["analysisType"]
      model = parsed_json["model"]
      prompt_tokens = parsed_json["promptTokens"]
      completion_tokens = parsed_json["completionTokens"]
      cost = parsed_json["cost"]
      new(
        analysis_type: analysis_type,
        model: model,
        prompt_tokens: prompt_tokens,
        completion_tokens: completion_tokens,
        cost: cost,
        additional_properties: struct
      )
    end

    # Serialize an instance of AnalysisCost to a JSON object
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
      obj.analysis_type.is_a?(Vapi::AnalysisCostAnalysisType) != false || raise("Passed value for field obj.analysis_type is not the expected type, validation failed.")
      obj.model.is_a?(Hash) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.prompt_tokens.is_a?(Float) != false || raise("Passed value for field obj.prompt_tokens is not the expected type, validation failed.")
      obj.completion_tokens.is_a?(Float) != false || raise("Passed value for field obj.completion_tokens is not the expected type, validation failed.")
      obj.cost.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
    end
  end
end
