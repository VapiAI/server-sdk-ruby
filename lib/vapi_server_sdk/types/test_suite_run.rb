# frozen_string_literal: true

require_relative "test_suite_run_status"
require "date"
require_relative "test_suite_run_test_result"
require "ostruct"
require "json"

module Vapi
  class TestSuiteRun
    # @return [Vapi::TestSuiteRunStatus] This is the current status of the test suite run.
    attr_reader :status
    # @return [String] This is the unique identifier for the test suite run.
    attr_reader :id
    # @return [String] This is the unique identifier for the organization this run belongs to.
    attr_reader :org_id
    # @return [String] This is the unique identifier for the test suite this run belongs to.
    attr_reader :test_suite_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the test suite run was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the test suite run was last
    #  updated.
    attr_reader :updated_at
    # @return [Array<Vapi::TestSuiteRunTestResult>] These are the results of the tests in this test suite run.
    attr_reader :test_results
    # @return [String] This is the name of the test suite run.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status [Vapi::TestSuiteRunStatus] This is the current status of the test suite run.
    # @param id [String] This is the unique identifier for the test suite run.
    # @param org_id [String] This is the unique identifier for the organization this run belongs to.
    # @param test_suite_id [String] This is the unique identifier for the test suite this run belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the test suite run was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the test suite run was last
    #  updated.
    # @param test_results [Array<Vapi::TestSuiteRunTestResult>] These are the results of the tests in this test suite run.
    # @param name [String] This is the name of the test suite run.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TestSuiteRun]
    def initialize(status:, id:, org_id:, test_suite_id:, created_at:, updated_at:, test_results:, name: OMIT,
                   additional_properties: nil)
      @status = status
      @id = id
      @org_id = org_id
      @test_suite_id = test_suite_id
      @created_at = created_at
      @updated_at = updated_at
      @test_results = test_results
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "status": status,
        "id": id,
        "orgId": org_id,
        "testSuiteId": test_suite_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "testResults": test_results,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TestSuiteRun
    #
    # @param json_object [String]
    # @return [Vapi::TestSuiteRun]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status = parsed_json["status"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      test_suite_id = parsed_json["testSuiteId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      test_results = parsed_json["testResults"]&.map do |item|
        item = item.to_json
        Vapi::TestSuiteRunTestResult.from_json(json_object: item)
      end
      name = parsed_json["name"]
      new(
        status: status,
        id: id,
        org_id: org_id,
        test_suite_id: test_suite_id,
        created_at: created_at,
        updated_at: updated_at,
        test_results: test_results,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of TestSuiteRun to a JSON object
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
      obj.status.is_a?(Vapi::TestSuiteRunStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.test_suite_id.is_a?(String) != false || raise("Passed value for field obj.test_suite_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.test_results.is_a?(Array) != false || raise("Passed value for field obj.test_results is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
