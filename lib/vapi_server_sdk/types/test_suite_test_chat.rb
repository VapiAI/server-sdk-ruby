# frozen_string_literal: true
require_relative "test_suite_test_scorer_ai"
require "date"
require "date"
require "ostruct"
require "json"

module Vapi
  class TestSuiteTestChat
  # @return [Array<Vapi::TestSuiteTestScorerAi>] These are the scorers used to evaluate the test.
    attr_reader :scorers
  # @return [String] This is the unique identifier for the test.
    attr_reader :id
  # @return [String] This is the unique identifier for the test suite this test belongs to.
    attr_reader :test_suite_id
  # @return [String] This is the unique identifier for the organization this test belongs to.
    attr_reader :org_id
  # @return [DateTime] This is the ISO 8601 date-time string of when the test was created.
    attr_reader :created_at
  # @return [DateTime] This is the ISO 8601 date-time string of when the test was last updated.
    attr_reader :updated_at
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
    # @param id [String] This is the unique identifier for the test.
    # @param test_suite_id [String] This is the unique identifier for the test suite this test belongs to.
    # @param org_id [String] This is the unique identifier for the organization this test belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the test was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the test was last updated.
    # @param name [String] This is the name of the test.
    # @param script [String] This is the script to be used for the chat test.
    # @param num_attempts [Float] This is the number of attempts allowed for the test.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TestSuiteTestChat]
    def initialize(scorers:, id:, test_suite_id:, org_id:, created_at:, updated_at:, name: OMIT, script:, num_attempts: OMIT, additional_properties: nil)
      @scorers = scorers
      @id = id
      @test_suite_id = test_suite_id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @script = script
      @num_attempts = num_attempts if num_attempts != OMIT
      @additional_properties = additional_properties
      @_field_set = { "scorers": scorers, "id": id, "testSuiteId": test_suite_id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at, "name": name, "script": script, "numAttempts": num_attempts }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TestSuiteTestChat
    #
    # @param json_object [String] 
    # @return [Vapi::TestSuiteTestChat]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      scorers = parsed_json["scorers"]&.map do | item |
  item = item.to_json
  Vapi::TestSuiteTestScorerAi.from_json(json_object: item)
end
      id = parsed_json["id"]
      test_suite_id = parsed_json["testSuiteId"]
      org_id = parsed_json["orgId"]
      created_at = unless parsed_json["createdAt"].nil?
  DateTime.parse(parsed_json["createdAt"])
else
  nil
end
      updated_at = unless parsed_json["updatedAt"].nil?
  DateTime.parse(parsed_json["updatedAt"])
else
  nil
end
      name = parsed_json["name"]
      script = parsed_json["script"]
      num_attempts = parsed_json["numAttempts"]
      new(
        scorers: scorers,
        id: id,
        test_suite_id: test_suite_id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        script: script,
        num_attempts: num_attempts,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteTestChat to a JSON object
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
      obj.scorers.is_a?(Array) != false || raise("Passed value for field obj.scorers is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.test_suite_id.is_a?(String) != false || raise("Passed value for field obj.test_suite_id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.script.is_a?(String) != false || raise("Passed value for field obj.script is not the expected type, validation failed.")
      obj.num_attempts&.is_a?(Float) != false || raise("Passed value for field obj.num_attempts is not the expected type, validation failed.")
    end
  end
end