# frozen_string_literal: true

require_relative "vapi_cost_sub_type"
require "ostruct"
require "json"

module Vapi
  class VapiCost
    # @return [Vapi::VapiCostSubType] This is the sub type of the cost.
    attr_reader :sub_type
    # @return [Float] This is the minutes of Vapi usage. This should match `call.endedAt` -
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

    # @param sub_type [Vapi::VapiCostSubType] This is the sub type of the cost.
    # @param minutes [Float] This is the minutes of Vapi usage. This should match `call.endedAt` -
    #  `call.startedAt`.
    # @param cost [Float] This is the cost of the component in USD.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VapiCost]
    def initialize(sub_type:, minutes:, cost:, additional_properties: nil)
      @sub_type = sub_type
      @minutes = minutes
      @cost = cost
      @additional_properties = additional_properties
      @_field_set = { "subType": sub_type, "minutes": minutes, "cost": cost }
    end

    # Deserialize a JSON object to an instance of VapiCost
    #
    # @param json_object [String]
    # @return [Vapi::VapiCost]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      sub_type = parsed_json["subType"]
      minutes = parsed_json["minutes"]
      cost = parsed_json["cost"]
      new(
        sub_type: sub_type,
        minutes: minutes,
        cost: cost,
        additional_properties: struct
      )
    end

    # Serialize an instance of VapiCost to a JSON object
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
      obj.sub_type.is_a?(Vapi::VapiCostSubType) != false || raise("Passed value for field obj.sub_type is not the expected type, validation failed.")
      obj.minutes.is_a?(Float) != false || raise("Passed value for field obj.minutes is not the expected type, validation failed.")
      obj.cost.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
    end
  end
end
