# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class InsightFormula
    # @return [String] This is the name of the formula.
    #  It will be used to label the formula in the insight board on the UI.
    attr_reader :name
    # @return [String] This is the formula to calculate the insight from the queries.
    #  The formula needs to be a valid mathematical expression.
    #  The formula must contain at least one query name in the LiquidJS format
    #  {{query_name}} or {{['query name']}} which will be substituted with the query
    #  result.
    #  Any MathJS formula is allowed - https://mathjs.org/docs/expressions/syntax.html
    #  Common valid math operations are +, -, *, /, %
    attr_reader :formula
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the formula.
    #  It will be used to label the formula in the insight board on the UI.
    # @param formula [String] This is the formula to calculate the insight from the queries.
    #  The formula needs to be a valid mathematical expression.
    #  The formula must contain at least one query name in the LiquidJS format
    #  {{query_name}} or {{['query name']}} which will be substituted with the query
    #  result.
    #  Any MathJS formula is allowed - https://mathjs.org/docs/expressions/syntax.html
    #  Common valid math operations are +, -, *, /, %
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::InsightFormula]
    def initialize(formula:, name: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @formula = formula
      @additional_properties = additional_properties
      @_field_set = { "name": name, "formula": formula }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of InsightFormula
    #
    # @param json_object [String]
    # @return [Vapi::InsightFormula]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      formula = parsed_json["formula"]
      new(
        name: name,
        formula: formula,
        additional_properties: struct
      )
    end

    # Serialize an instance of InsightFormula to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.formula.is_a?(String) != false || raise("Passed value for field obj.formula is not the expected type, validation failed.")
    end
  end
end
