# frozen_string_literal: true

require_relative "insight_run_format_plan_format"
require "ostruct"
require "json"

module Vapi
  class InsightRunFormatPlan
    # @return [Vapi::InsightRunFormatPlanFormat] This is the format of the data to return.
    #  If not provided, defaults to "raw".
    #  Raw provides the data as fetched from the database, with formulas evaluated.
    #  Recharts provides the data in a format that can is ready to be used by
    #  recharts.js to render charts.
    attr_reader :format
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param format [Vapi::InsightRunFormatPlanFormat] This is the format of the data to return.
    #  If not provided, defaults to "raw".
    #  Raw provides the data as fetched from the database, with formulas evaluated.
    #  Recharts provides the data in a format that can is ready to be used by
    #  recharts.js to render charts.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::InsightRunFormatPlan]
    def initialize(format: OMIT, additional_properties: nil)
      @format = format if format != OMIT
      @additional_properties = additional_properties
      @_field_set = { "format": format }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of InsightRunFormatPlan
    #
    # @param json_object [String]
    # @return [Vapi::InsightRunFormatPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      format = parsed_json["format"]
      new(format: format, additional_properties: struct)
    end

    # Serialize an instance of InsightRunFormatPlan to a JSON object
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
      obj.format&.is_a?(Vapi::InsightRunFormatPlanFormat) != false || raise("Passed value for field obj.format is not the expected type, validation failed.")
    end
  end
end
