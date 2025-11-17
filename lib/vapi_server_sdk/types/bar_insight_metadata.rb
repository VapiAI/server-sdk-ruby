# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class BarInsightMetadata
    # @return [String]
    attr_reader :x_axis_label
    # @return [String]
    attr_reader :y_axis_label
    # @return [Float]
    attr_reader :y_axis_min
    # @return [Float]
    attr_reader :y_axis_max
    # @return [String]
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param x_axis_label [String]
    # @param y_axis_label [String]
    # @param y_axis_min [Float]
    # @param y_axis_max [Float]
    # @param name [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::BarInsightMetadata]
    def initialize(x_axis_label: OMIT, y_axis_label: OMIT, y_axis_min: OMIT, y_axis_max: OMIT, name: OMIT,
                   additional_properties: nil)
      @x_axis_label = x_axis_label if x_axis_label != OMIT
      @y_axis_label = y_axis_label if y_axis_label != OMIT
      @y_axis_min = y_axis_min if y_axis_min != OMIT
      @y_axis_max = y_axis_max if y_axis_max != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "xAxisLabel": x_axis_label,
        "yAxisLabel": y_axis_label,
        "yAxisMin": y_axis_min,
        "yAxisMax": y_axis_max,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of BarInsightMetadata
    #
    # @param json_object [String]
    # @return [Vapi::BarInsightMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      x_axis_label = parsed_json["xAxisLabel"]
      y_axis_label = parsed_json["yAxisLabel"]
      y_axis_min = parsed_json["yAxisMin"]
      y_axis_max = parsed_json["yAxisMax"]
      name = parsed_json["name"]
      new(
        x_axis_label: x_axis_label,
        y_axis_label: y_axis_label,
        y_axis_min: y_axis_min,
        y_axis_max: y_axis_max,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of BarInsightMetadata to a JSON object
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
      obj.x_axis_label&.is_a?(String) != false || raise("Passed value for field obj.x_axis_label is not the expected type, validation failed.")
      obj.y_axis_label&.is_a?(String) != false || raise("Passed value for field obj.y_axis_label is not the expected type, validation failed.")
      obj.y_axis_min&.is_a?(Float) != false || raise("Passed value for field obj.y_axis_min is not the expected type, validation failed.")
      obj.y_axis_max&.is_a?(Float) != false || raise("Passed value for field obj.y_axis_max is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
