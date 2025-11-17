# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ScorecardMetric
    # @return [String] This is the unique identifier for the structured output that will be used to
    #  evaluate the scorecard.
    #  The structured output must be of type number or boolean only for now.
    attr_reader :structured_output_id
    # @return [Array<Hash{String => Object}>] These are the conditions that will be used to evaluate the scorecard.
    #  Each condition will have a comparator, value, and points that will be used to
    #  calculate the final score.
    #  The points will be added to the overall score if the condition is met.
    #  The overall score will be normalized to a 100 point scale to ensure uniformity
    #  across different scorecards.
    attr_reader :conditions
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param structured_output_id [String] This is the unique identifier for the structured output that will be used to
    #  evaluate the scorecard.
    #  The structured output must be of type number or boolean only for now.
    # @param conditions [Array<Hash{String => Object}>] These are the conditions that will be used to evaluate the scorecard.
    #  Each condition will have a comparator, value, and points that will be used to
    #  calculate the final score.
    #  The points will be added to the overall score if the condition is met.
    #  The overall score will be normalized to a 100 point scale to ensure uniformity
    #  across different scorecards.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ScorecardMetric]
    def initialize(structured_output_id:, conditions:, additional_properties: nil)
      @structured_output_id = structured_output_id
      @conditions = conditions
      @additional_properties = additional_properties
      @_field_set = { "structuredOutputId": structured_output_id, "conditions": conditions }
    end

    # Deserialize a JSON object to an instance of ScorecardMetric
    #
    # @param json_object [String]
    # @return [Vapi::ScorecardMetric]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      structured_output_id = parsed_json["structuredOutputId"]
      conditions = parsed_json["conditions"]
      new(
        structured_output_id: structured_output_id,
        conditions: conditions,
        additional_properties: struct
      )
    end

    # Serialize an instance of ScorecardMetric to a JSON object
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
      obj.structured_output_id.is_a?(String) != false || raise("Passed value for field obj.structured_output_id is not the expected type, validation failed.")
      obj.conditions.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
    end
  end
end
