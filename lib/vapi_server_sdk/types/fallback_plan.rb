# frozen_string_literal: true

require_relative "fallback_plan_voices_item"
require "ostruct"
require "json"

module Vapi
  class FallbackPlan
    # @return [Array<Vapi::FallbackPlanVoicesItem>] This is the list of voices to fallback to in the event that the primary voice
    #  provider fails.
    attr_reader :voices
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param voices [Array<Vapi::FallbackPlanVoicesItem>] This is the list of voices to fallback to in the event that the primary voice
    #  provider fails.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackPlan]
    def initialize(voices:, additional_properties: nil)
      @voices = voices
      @additional_properties = additional_properties
      @_field_set = { "voices": voices }
    end

    # Deserialize a JSON object to an instance of FallbackPlan
    #
    # @param json_object [String]
    # @return [Vapi::FallbackPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      voices = parsed_json["voices"]&.map do |item|
        item = item.to_json
        Vapi::FallbackPlanVoicesItem.from_json(json_object: item)
      end
      new(voices: voices, additional_properties: struct)
    end

    # Serialize an instance of FallbackPlan to a JSON object
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
      obj.voices.is_a?(Array) != false || raise("Passed value for field obj.voices is not the expected type, validation failed.")
    end
  end
end
