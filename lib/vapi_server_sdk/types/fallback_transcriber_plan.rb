# frozen_string_literal: true

require_relative "fallback_transcriber_plan_transcribers_item"
require "ostruct"
require "json"

module Vapi
  class FallbackTranscriberPlan
    # @return [Array<Vapi::FallbackTranscriberPlanTranscribersItem>]
    attr_reader :transcribers
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param transcribers [Array<Vapi::FallbackTranscriberPlanTranscribersItem>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackTranscriberPlan]
    def initialize(transcribers:, additional_properties: nil)
      @transcribers = transcribers
      @additional_properties = additional_properties
      @_field_set = { "transcribers": transcribers }
    end

    # Deserialize a JSON object to an instance of FallbackTranscriberPlan
    #
    # @param json_object [String]
    # @return [Vapi::FallbackTranscriberPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      transcribers = parsed_json["transcribers"]&.map do |item|
        item = item.to_json
        Vapi::FallbackTranscriberPlanTranscribersItem.from_json(json_object: item)
      end
      new(transcribers: transcribers, additional_properties: struct)
    end

    # Serialize an instance of FallbackTranscriberPlan to a JSON object
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
      obj.transcribers.is_a?(Array) != false || raise("Passed value for field obj.transcribers is not the expected type, validation failed.")
    end
  end
end
