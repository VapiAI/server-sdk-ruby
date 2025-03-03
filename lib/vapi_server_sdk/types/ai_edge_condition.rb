# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class AiEdgeCondition
    # @return [Array<String>]
    attr_reader :matches
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param matches [Array<String>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AiEdgeCondition]
    def initialize(matches:, additional_properties: nil)
      @matches = matches
      @additional_properties = additional_properties
      @_field_set = { "matches": matches }
    end

    # Deserialize a JSON object to an instance of AiEdgeCondition
    #
    # @param json_object [String]
    # @return [Vapi::AiEdgeCondition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      matches = parsed_json["matches"]
      new(matches: matches, additional_properties: struct)
    end

    # Serialize an instance of AiEdgeCondition to a JSON object
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
      obj.matches.is_a?(Array) != false || raise("Passed value for field obj.matches is not the expected type, validation failed.")
    end
  end
end
