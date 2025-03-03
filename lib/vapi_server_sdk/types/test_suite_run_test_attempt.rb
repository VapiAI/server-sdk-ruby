# frozen_string_literal: true

require_relative "test_suite_run_scorer_ai"
require_relative "test_suite_run_test_attempt_call"
require "ostruct"
require "json"

module Vapi
  class TestSuiteRunTestAttempt
    # @return [Array<Vapi::TestSuiteRunScorerAi>] These are the results of the scorers used to evaluate the test attempt.
    attr_reader :scorer_results
    # @return [Vapi::TestSuiteRunTestAttemptCall] This is the call made during the test attempt.
    attr_reader :call
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scorer_results [Array<Vapi::TestSuiteRunScorerAi>] These are the results of the scorers used to evaluate the test attempt.
    # @param call [Vapi::TestSuiteRunTestAttemptCall] This is the call made during the test attempt.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TestSuiteRunTestAttempt]
    def initialize(scorer_results:, call:, additional_properties: nil)
      @scorer_results = scorer_results
      @call = call
      @additional_properties = additional_properties
      @_field_set = { "scorerResults": scorer_results, "call": call }
    end

    # Deserialize a JSON object to an instance of TestSuiteRunTestAttempt
    #
    # @param json_object [String]
    # @return [Vapi::TestSuiteRunTestAttempt]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      scorer_results = parsed_json["scorerResults"]&.map do |item|
        item = item.to_json
        Vapi::TestSuiteRunScorerAi.from_json(json_object: item)
      end
      if parsed_json["call"].nil?
        call = nil
      else
        call = parsed_json["call"].to_json
        call = Vapi::TestSuiteRunTestAttemptCall.from_json(json_object: call)
      end
      new(
        scorer_results: scorer_results,
        call: call,
        additional_properties: struct
      )
    end

    # Serialize an instance of TestSuiteRunTestAttempt to a JSON object
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
      obj.scorer_results.is_a?(Array) != false || raise("Passed value for field obj.scorer_results is not the expected type, validation failed.")
      Vapi::TestSuiteRunTestAttemptCall.validate_raw(obj: obj.call)
    end
  end
end
