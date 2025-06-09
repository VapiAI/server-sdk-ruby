# frozen_string_literal: true
require_relative "test_suite_tests_paginated_response_results_item"
require_relative "pagination_meta"
require "ostruct"
require "json"

module Vapi
  class TestSuiteTestsPaginatedResponse
  # @return [Array<Vapi::TestSuiteTestsPaginatedResponseResultsItem>] A list of test suite tests.
    attr_reader :results
  # @return [Vapi::PaginationMeta] Metadata about the pagination.
    attr_reader :metadata
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param results [Array<Vapi::TestSuiteTestsPaginatedResponseResultsItem>] A list of test suite tests.
    # @param metadata [Vapi::PaginationMeta] Metadata about the pagination.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TestSuiteTestsPaginatedResponse]
    def initialize(results:, metadata:, additional_properties: nil)
      @results = results
      @metadata = metadata
      @additional_properties = additional_properties
      @_field_set = { "results": results, "metadata": metadata }
    end
# Deserialize a JSON object to an instance of TestSuiteTestsPaginatedResponse
    #
    # @param json_object [String] 
    # @return [Vapi::TestSuiteTestsPaginatedResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      results = parsed_json["results"]&.map do | item |
  item = item.to_json
  Vapi::TestSuiteTestsPaginatedResponseResultsItem.from_json(json_object: item)
end
      unless parsed_json["metadata"].nil?
        metadata = parsed_json["metadata"].to_json
        metadata = Vapi::PaginationMeta.from_json(json_object: metadata)
      else
        metadata = nil
      end
      new(
        results: results,
        metadata: metadata,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteTestsPaginatedResponse to a JSON object
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
      obj.results.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      Vapi::PaginationMeta.validate_raw(obj: obj.metadata)
    end
  end
end