# frozen_string_literal: true

require_relative "pagination_meta"
require "ostruct"
require "json"

module Vapi
  class AssistantVersionPaginatedResponse
    # @return [Array<Object>]
    attr_reader :results
    # @return [Vapi::PaginationMeta]
    attr_reader :metadata
    # @return [String]
    attr_reader :next_page_state
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param results [Array<Object>]
    # @param metadata [Vapi::PaginationMeta]
    # @param next_page_state [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssistantVersionPaginatedResponse]
    def initialize(results:, metadata:, next_page_state: OMIT, additional_properties: nil)
      @results = results
      @metadata = metadata
      @next_page_state = next_page_state if next_page_state != OMIT
      @additional_properties = additional_properties
      @_field_set = { "results": results, "metadata": metadata, "nextPageState": next_page_state }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AssistantVersionPaginatedResponse
    #
    # @param json_object [String]
    # @return [Vapi::AssistantVersionPaginatedResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      results = parsed_json["results"]
      if parsed_json["metadata"].nil?
        metadata = nil
      else
        metadata = parsed_json["metadata"].to_json
        metadata = Vapi::PaginationMeta.from_json(json_object: metadata)
      end
      next_page_state = parsed_json["nextPageState"]
      new(
        results: results,
        metadata: metadata,
        next_page_state: next_page_state,
        additional_properties: struct
      )
    end

    # Serialize an instance of AssistantVersionPaginatedResponse to a JSON object
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
      obj.next_page_state&.is_a?(String) != false || raise("Passed value for field obj.next_page_state is not the expected type, validation failed.")
    end
  end
end
