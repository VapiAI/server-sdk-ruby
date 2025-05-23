# frozen_string_literal: true

require_relative "variable_extraction_schema"
require "ostruct"
require "json"

module Vapi
  class VariableExtractionPlan
    # @return [Array<Vapi::VariableExtractionSchema>]
    attr_reader :output
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param output [Array<Vapi::VariableExtractionSchema>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VariableExtractionPlan]
    def initialize(output:, additional_properties: nil)
      @output = output
      @additional_properties = additional_properties
      @_field_set = { "output": output }
    end

    # Deserialize a JSON object to an instance of VariableExtractionPlan
    #
    # @param json_object [String]
    # @return [Vapi::VariableExtractionPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      output = parsed_json["output"]&.map do |item|
        item = item.to_json
        Vapi::VariableExtractionSchema.from_json(json_object: item)
      end
      new(output: output, additional_properties: struct)
    end

    # Serialize an instance of VariableExtractionPlan to a JSON object
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
      obj.output.is_a?(Array) != false || raise("Passed value for field obj.output is not the expected type, validation failed.")
    end
  end
end
