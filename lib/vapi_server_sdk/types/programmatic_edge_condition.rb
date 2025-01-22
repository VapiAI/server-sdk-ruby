# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ProgrammaticEdgeCondition
    # @return [String]
    attr_reader :boolean_expression
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param boolean_expression [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ProgrammaticEdgeCondition]
    def initialize(boolean_expression: OMIT, additional_properties: nil)
      @boolean_expression = boolean_expression if boolean_expression != OMIT
      @additional_properties = additional_properties
      @_field_set = { "booleanExpression": boolean_expression }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ProgrammaticEdgeCondition
    #
    # @param json_object [String]
    # @return [Vapi::ProgrammaticEdgeCondition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      boolean_expression = parsed_json["booleanExpression"]
      new(boolean_expression: boolean_expression, additional_properties: struct)
    end

    # Serialize an instance of ProgrammaticEdgeCondition to a JSON object
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
      obj.boolean_expression&.is_a?(String) != false || raise("Passed value for field obj.boolean_expression is not the expected type, validation failed.")
    end
  end
end
