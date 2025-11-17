# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class StructuredOutputFilterDto
    # @return [String] Equal to
    attr_reader :eq
    # @return [String] Not equal to
    attr_reader :neq
    # @return [String] Greater than
    attr_reader :gt
    # @return [String] Greater than or equal to
    attr_reader :gte
    # @return [String] Less than
    attr_reader :lt
    # @return [String] Less than or equal to
    attr_reader :lte
    # @return [String] Contains
    attr_reader :contains
    # @return [String] Not contains
    attr_reader :not_contains
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param eq [String] Equal to
    # @param neq [String] Not equal to
    # @param gt [String] Greater than
    # @param gte [String] Greater than or equal to
    # @param lt [String] Less than
    # @param lte [String] Less than or equal to
    # @param contains [String] Contains
    # @param not_contains [String] Not contains
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::StructuredOutputFilterDto]
    def initialize(eq: OMIT, neq: OMIT, gt: OMIT, gte: OMIT, lt: OMIT, lte: OMIT, contains: OMIT, not_contains: OMIT,
                   additional_properties: nil)
      @eq = eq if eq != OMIT
      @neq = neq if neq != OMIT
      @gt = gt if gt != OMIT
      @gte = gte if gte != OMIT
      @lt = lt if lt != OMIT
      @lte = lte if lte != OMIT
      @contains = contains if contains != OMIT
      @not_contains = not_contains if not_contains != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "eq": eq,
        "neq": neq,
        "gt": gt,
        "gte": gte,
        "lt": lt,
        "lte": lte,
        "contains": contains,
        "notContains": not_contains
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of StructuredOutputFilterDto
    #
    # @param json_object [String]
    # @return [Vapi::StructuredOutputFilterDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      eq = parsed_json["eq"]
      neq = parsed_json["neq"]
      gt = parsed_json["gt"]
      gte = parsed_json["gte"]
      lt = parsed_json["lt"]
      lte = parsed_json["lte"]
      contains = parsed_json["contains"]
      not_contains = parsed_json["notContains"]
      new(
        eq: eq,
        neq: neq,
        gt: gt,
        gte: gte,
        lt: lt,
        lte: lte,
        contains: contains,
        not_contains: not_contains,
        additional_properties: struct
      )
    end

    # Serialize an instance of StructuredOutputFilterDto to a JSON object
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
      obj.eq&.is_a?(String) != false || raise("Passed value for field obj.eq is not the expected type, validation failed.")
      obj.neq&.is_a?(String) != false || raise("Passed value for field obj.neq is not the expected type, validation failed.")
      obj.gt&.is_a?(String) != false || raise("Passed value for field obj.gt is not the expected type, validation failed.")
      obj.gte&.is_a?(String) != false || raise("Passed value for field obj.gte is not the expected type, validation failed.")
      obj.lt&.is_a?(String) != false || raise("Passed value for field obj.lt is not the expected type, validation failed.")
      obj.lte&.is_a?(String) != false || raise("Passed value for field obj.lte is not the expected type, validation failed.")
      obj.contains&.is_a?(String) != false || raise("Passed value for field obj.contains is not the expected type, validation failed.")
      obj.not_contains&.is_a?(String) != false || raise("Passed value for field obj.not_contains is not the expected type, validation failed.")
    end
  end
end
