# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class SubscriptionConcurrencyLineBuyDto
    # @return [Float] This is the number of concurrency lines to purchase.
    attr_reader :quantity
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param quantity [Float] This is the number of concurrency lines to purchase.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SubscriptionConcurrencyLineBuyDto]
    def initialize(quantity:, additional_properties: nil)
      @quantity = quantity
      @additional_properties = additional_properties
      @_field_set = { "quantity": quantity }
    end

    # Deserialize a JSON object to an instance of SubscriptionConcurrencyLineBuyDto
    #
    # @param json_object [String]
    # @return [Vapi::SubscriptionConcurrencyLineBuyDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      quantity = parsed_json["quantity"]
      new(quantity: quantity, additional_properties: struct)
    end

    # Serialize an instance of SubscriptionConcurrencyLineBuyDto to a JSON object
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
      obj.quantity.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
    end
  end
end
