# frozen_string_literal: true

require_relative "test_suite_test_scorer_ai"
require "ostruct"
require "json"

module Vapi
  class UpdateTestSuiteTestChatDto
    # @return [Array<Vapi::TestSuiteTestScorerAi>] These are the scorers used to evaluate the test.
    attr_reader :scorers
    # @return [String] This is the name of the test.
    attr_reader :name
    # @return [String] This is the script to be used for the chat test.
    attr_reader :script
    # @return [Float] This is the number of attempts allowed for the test.
    attr_reader :num_attempts
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scorers [Array<Vapi::TestSuiteTestScorerAi>] These are the scorers used to evaluate the test.
    # @param name [String] This is the name of the test.
    # @param script [String] This is the script to be used for the chat test.
    # @param num_attempts [Float] This is the number of attempts allowed for the test.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateTestSuiteTestChatDto]
    def initialize(scorers: OMIT, name: OMIT, script: OMIT, num_attempts: OMIT, additional_properties: nil)
      @scorers = scorers if scorers != OMIT
      @name = name if name != OMIT
      @script = script if script != OMIT
      @num_attempts = num_attempts if num_attempts != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "scorers": scorers,
        "name": name,
        "script": script,
        "numAttempts": num_attempts
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateTestSuiteTestChatDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateTestSuiteTestChatDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      scorers = parsed_json["scorers"]&.map do |item|
        item = item.to_json
        Vapi::TestSuiteTestScorerAi.from_json(json_object: item)
      end
      name = parsed_json["name"]
      script = parsed_json["script"]
      num_attempts = parsed_json["numAttempts"]
      new(
        scorers: scorers,
        name: name,
        script: script,
        num_attempts: num_attempts,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateTestSuiteTestChatDto to a JSON object
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
      obj.scorers&.is_a?(Array) != false || raise("Passed value for field obj.scorers is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.script&.is_a?(String) != false || raise("Passed value for field obj.script is not the expected type, validation failed.")
      obj.num_attempts&.is_a?(Float) != false || raise("Passed value for field obj.num_attempts is not the expected type, validation failed.")
    end
  end
end
