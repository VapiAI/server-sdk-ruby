# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ContextEngineeringPlanLastNMessages
    # @return [Float] This is the maximum number of messages to include in the context engineering
    #  plan.
    attr_reader :max_messages
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param max_messages [Float] This is the maximum number of messages to include in the context engineering
    #  plan.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ContextEngineeringPlanLastNMessages]
    def initialize(max_messages:, additional_properties: nil)
      @max_messages = max_messages
      @additional_properties = additional_properties
      @_field_set = { "maxMessages": max_messages }
    end

    # Deserialize a JSON object to an instance of ContextEngineeringPlanLastNMessages
    #
    # @param json_object [String]
    # @return [Vapi::ContextEngineeringPlanLastNMessages]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      max_messages = parsed_json["maxMessages"]
      new(max_messages: max_messages, additional_properties: struct)
    end

    # Serialize an instance of ContextEngineeringPlanLastNMessages to a JSON object
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
      obj.max_messages.is_a?(Float) != false || raise("Passed value for field obj.max_messages is not the expected type, validation failed.")
    end
  end
end
