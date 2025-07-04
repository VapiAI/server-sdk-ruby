# frozen_string_literal: true

require_relative "phone_number_paginated_response_results_item"
require_relative "pagination_meta"
require "ostruct"
require "json"

module Vapi
  class PhoneNumberPaginatedResponse
    # @return [Array<Vapi::PhoneNumberPaginatedResponseResultsItem>] A list of phone numbers, which can be of any provider type.
    attr_reader :results
    # @return [Vapi::PaginationMeta] Metadata about the pagination.
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param results [Array<Vapi::PhoneNumberPaginatedResponseResultsItem>] A list of phone numbers, which can be of any provider type.
    # @param metadata [Vapi::PaginationMeta] Metadata about the pagination.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::PhoneNumberPaginatedResponse]
    def initialize(results:, metadata:, additional_properties: nil)
      @results = results
      @metadata = metadata
      @additional_properties = additional_properties
      @_field_set = { "results": results, "metadata": metadata }
    end

    # Deserialize a JSON object to an instance of PhoneNumberPaginatedResponse
    #
    # @param json_object [String]
    # @return [Vapi::PhoneNumberPaginatedResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      results = parsed_json["results"]&.map do |item|
        item = item.to_json
        Vapi::PhoneNumberPaginatedResponseResultsItem.from_json(json_object: item)
      end
      if parsed_json["metadata"].nil?
        metadata = nil
      else
        metadata = parsed_json["metadata"].to_json
        metadata = Vapi::PaginationMeta.from_json(json_object: metadata)
      end
      new(
        results: results,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of PhoneNumberPaginatedResponse to a JSON object
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
      obj.results.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      Vapi::PaginationMeta.validate_raw(obj: obj.metadata)
    end
  end
end
