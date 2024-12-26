# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class CreditsBuyDto
    # @return [Float] This is the number of credits to add to the subscription.
    attr_reader :credits
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param credits [Float] This is the number of credits to add to the subscription.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreditsBuyDto]
    def initialize(credits:, additional_properties: nil)
      @credits = credits
      @additional_properties = additional_properties
      @_field_set = { "credits": credits }
    end

    # Deserialize a JSON object to an instance of CreditsBuyDto
    #
    # @param json_object [String]
    # @return [Vapi::CreditsBuyDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      credits = parsed_json["credits"]
      new(credits: credits, additional_properties: struct)
    end

    # Serialize an instance of CreditsBuyDto to a JSON object
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
    end
  end
end
