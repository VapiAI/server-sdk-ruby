# frozen_string_literal: true

require_relative "test_suite_run_scorer_ai_result"
require "ostruct"
require "json"

module Vapi
  class TestSuiteRunScorerAi
    # @return [String] This is the type of the scorer, which must be AI.
    attr_reader :type
    # @return [Vapi::TestSuiteRunScorerAiResult] This is the result of the test suite.
    attr_reader :result
    # @return [String] This is the reasoning provided by the AI scorer.
    attr_reader :reasoning
    # @return [String] This is the rubric used by the AI scorer.
    attr_reader :rubric
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of the scorer, which must be AI.
    # @param result [Vapi::TestSuiteRunScorerAiResult] This is the result of the test suite.
    # @param reasoning [String] This is the reasoning provided by the AI scorer.
    # @param rubric [String] This is the rubric used by the AI scorer.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TestSuiteRunScorerAi]
    def initialize(type:, result:, reasoning:, rubric:, additional_properties: nil)
      @type = type
      @result = result
      @reasoning = reasoning
      @rubric = rubric
      @additional_properties = additional_properties
      @_field_set = { "type": type, "result": result, "reasoning": reasoning, "rubric": rubric }
    end

    # Deserialize a JSON object to an instance of TestSuiteRunScorerAi
    #
    # @param json_object [String]
    # @return [Vapi::TestSuiteRunScorerAi]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      result = parsed_json["result"]
      reasoning = parsed_json["reasoning"]
      rubric = parsed_json["rubric"]
      new(
        type: type,
        result: result,
        reasoning: reasoning,
        rubric: rubric,
        additional_properties: struct
      )
    end

    # Serialize an instance of TestSuiteRunScorerAi to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.result.is_a?(Vapi::TestSuiteRunScorerAiResult) != false || raise("Passed value for field obj.result is not the expected type, validation failed.")
      obj.reasoning.is_a?(String) != false || raise("Passed value for field obj.reasoning is not the expected type, validation failed.")
      obj.rubric.is_a?(String) != false || raise("Passed value for field obj.rubric is not the expected type, validation failed.")
    end
  end
end
