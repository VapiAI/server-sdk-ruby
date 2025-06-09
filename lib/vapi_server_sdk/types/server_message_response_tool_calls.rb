# frozen_string_literal: true
require_relative "tool_call_result"
require "ostruct"
require "json"

module Vapi
  class ServerMessageResponseToolCalls
  # @return [Array<Vapi::ToolCallResult>] These are the results of the "tool-calls" message.
    attr_reader :results
  # @return [String] This is the error message if the tool call was not successful.
    attr_reader :error
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param results [Array<Vapi::ToolCallResult>] These are the results of the "tool-calls" message.
    # @param error [String] This is the error message if the tool call was not successful.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageResponseToolCalls]
    def initialize(results: OMIT, error: OMIT, additional_properties: nil)
      @results = results if results != OMIT
      @error = error if error != OMIT
      @additional_properties = additional_properties
      @_field_set = { "results": results, "error": error }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ServerMessageResponseToolCalls
    #
    # @param json_object [String] 
    # @return [Vapi::ServerMessageResponseToolCalls]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      results = parsed_json["results"]&.map do | item |
  item = item.to_json
  Vapi::ToolCallResult.from_json(json_object: item)
end
      error = parsed_json["error"]
      new(
        results: results,
        error: error,
        additional_properties: struct
      )
    end
# Serialize an instance of ServerMessageResponseToolCalls to a JSON object
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
      obj.results&.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
    end
  end
end