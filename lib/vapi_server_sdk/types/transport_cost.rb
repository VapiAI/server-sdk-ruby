# frozen_string_literal: true
require_relative "transport_cost_provider"
require "ostruct"
require "json"

module Vapi
  class TransportCost
  # @return [Vapi::TransportCostProvider] 
    attr_reader :provider
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

    # @param provider [Vapi::TransportCostProvider] 
    # @param minutes [Float] This is the minutes of `transport` usage. This should match `call.endedAt` -
#  `call.startedAt`.
    # @param cost [Float] This is the cost of the component in USD.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransportCost]
    def initialize(provider: OMIT, minutes:, cost:, additional_properties: nil)
      @provider = provider if provider != OMIT
      @minutes = minutes
      @cost = cost
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "minutes": minutes, "cost": cost }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TransportCost
    #
    # @param json_object [String] 
    # @return [Vapi::TransportCost]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      minutes = parsed_json["minutes"]
      cost = parsed_json["cost"]
      new(
        provider: provider,
        minutes: minutes,
        cost: cost,
        additional_properties: struct
      )
    end
# Serialize an instance of TransportCost to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.provider&.is_a?(Vapi::TransportCostProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.minutes.is_a?(Float) != false || raise("Passed value for field obj.minutes is not the expected type, validation failed.")
      obj.cost.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
    end
  end
end