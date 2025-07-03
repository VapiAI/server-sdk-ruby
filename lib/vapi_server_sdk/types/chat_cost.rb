# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class ChatCost
  # @return [Float] This is the cost of the component in USD.
    attr_reader :cost
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param cost [Float] This is the cost of the component in USD.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChatCost]
    def initialize(cost:, additional_properties: nil)
      @cost = cost
      @additional_properties = additional_properties
      @_field_set = { "cost": cost }
    end
# Deserialize a JSON object to an instance of ChatCost
    #
    # @param json_object [String] 
    # @return [Vapi::ChatCost]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      cost = parsed_json["cost"]
      new(cost: cost, additional_properties: struct)
    end
# Serialize an instance of ChatCost to a JSON object
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
      obj.cost.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
    end
  end
end