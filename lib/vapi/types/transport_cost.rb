# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class TransportCost
    # @return [String] This is the type of cost, always 'transport' for this class.
    attr_reader :type
    # @return [Float] This is the minutes of `transport` usage. This should match `call.endedAt` -
    #  `call.startedAt`.
    attr_reader :minutes
    # @return [Float] This is the cost of the component in USD.
    attr_reader :cost
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of cost, always 'transport' for this class.
    # @param minutes [Float] This is the minutes of `transport` usage. This should match `call.endedAt` -
    #  `call.startedAt`.
    # @param cost [Float] This is the cost of the component in USD.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransportCost]
    def initialize(type:, minutes:, cost:, additional_properties: nil)
      @type = type
      @minutes = minutes
      @cost = cost
      @additional_properties = additional_properties
      @_field_set = { "type": type, "minutes": minutes, "cost": cost }
    end

    # Deserialize a JSON object to an instance of TransportCost
    #
    # @param json_object [String]
    # @return [Vapi::TransportCost]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      minutes = parsed_json["minutes"]
      cost = parsed_json["cost"]
      new(
        type: type,
        minutes: minutes,
        cost: cost,
        additional_properties: struct
      )
    end

    # Serialize an instance of TransportCost to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.minutes.is_a?(Float) != false || raise("Passed value for field obj.minutes is not the expected type, validation failed.")
      obj.cost.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
    end
  end
end
