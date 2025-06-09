# frozen_string_literal: true
require_relative "test_suite_test_voice"
require_relative "test_suite_run_test_attempt"
require "ostruct"
require "json"

module Vapi
  class TestSuiteRunTestResult
  # @return [Vapi::TestSuiteTestVoice] This is the test that was run.
    attr_reader :test
  # @return [Array<Vapi::TestSuiteRunTestAttempt>] These are the attempts made for this test.
    attr_reader :attempts
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param test [Vapi::TestSuiteTestVoice] This is the test that was run.
    # @param attempts [Array<Vapi::TestSuiteRunTestAttempt>] These are the attempts made for this test.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TestSuiteRunTestResult]
    def initialize(test:, attempts:, additional_properties: nil)
      @test = test
      @attempts = attempts
      @additional_properties = additional_properties
      @_field_set = { "test": test, "attempts": attempts }
    end
# Deserialize a JSON object to an instance of TestSuiteRunTestResult
    #
    # @param json_object [String] 
    # @return [Vapi::TestSuiteRunTestResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["test"].nil?
        test = parsed_json["test"].to_json
        test = Vapi::TestSuiteTestVoice.from_json(json_object: test)
      else
        test = nil
      end
      attempts = parsed_json["attempts"]&.map do | item |
  item = item.to_json
  Vapi::TestSuiteRunTestAttempt.from_json(json_object: item)
end
      new(
        test: test,
        attempts: attempts,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunTestResult to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      Vapi::TestSuiteTestVoice.validate_raw(obj: obj.test)
      obj.attempts.is_a?(Array) != false || raise("Passed value for field obj.attempts is not the expected type, validation failed.")
    end
  end
end