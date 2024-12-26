# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class SubscriptionMonthlyCharge
    # @return [Float] This is the monthly charge for the subscription.
    attr_reader :monthly_charge
    # @return [Array<Hash{String => Object}>] These are the different costs that make up the monthly charge.
    attr_reader :costs
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param monthly_charge [Float] This is the monthly charge for the subscription.
    # @param costs [Array<Hash{String => Object}>] These are the different costs that make up the monthly charge.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SubscriptionMonthlyCharge]
    def initialize(monthly_charge:, costs:, additional_properties: nil)
      @monthly_charge = monthly_charge
      @costs = costs
      @additional_properties = additional_properties
      @_field_set = { "monthlyCharge": monthly_charge, "costs": costs }
    end

    # Deserialize a JSON object to an instance of SubscriptionMonthlyCharge
    #
    # @param json_object [String]
    # @return [Vapi::SubscriptionMonthlyCharge]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      monthly_charge = parsed_json["monthlyCharge"]
      costs = parsed_json["costs"]
      new(
        monthly_charge: monthly_charge,
        costs: costs,
        additional_properties: struct
      )
    end

    # Serialize an instance of SubscriptionMonthlyCharge to a JSON object
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
      obj.monthly_charge.is_a?(Float) != false || raise("Passed value for field obj.monthly_charge is not the expected type, validation failed.")
      obj.costs.is_a?(Array) != false || raise("Passed value for field obj.costs is not the expected type, validation failed.")
    end
  end
end
