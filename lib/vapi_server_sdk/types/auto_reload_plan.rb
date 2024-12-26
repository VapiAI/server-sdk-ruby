# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class AutoReloadPlan
    # @return [Float] This the amount of credits to reload.
    attr_reader :credits
    # @return [Float] This is the limit at which the reload is triggered.
    attr_reader :threshold
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param credits [Float] This the amount of credits to reload.
    # @param threshold [Float] This is the limit at which the reload is triggered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AutoReloadPlan]
    def initialize(credits:, threshold:, additional_properties: nil)
      @credits = credits
      @threshold = threshold
      @additional_properties = additional_properties
      @_field_set = { "credits": credits, "threshold": threshold }
    end

    # Deserialize a JSON object to an instance of AutoReloadPlan
    #
    # @param json_object [String]
    # @return [Vapi::AutoReloadPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      credits = parsed_json["credits"]
      threshold = parsed_json["threshold"]
      new(
        credits: credits,
        threshold: threshold,
        additional_properties: struct
      )
    end

    # Serialize an instance of AutoReloadPlan to a JSON object
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
      obj.credits.is_a?(Float) != false || raise("Passed value for field obj.credits is not the expected type, validation failed.")
      obj.threshold.is_a?(Float) != false || raise("Passed value for field obj.threshold is not the expected type, validation failed.")
    end
  end
end
