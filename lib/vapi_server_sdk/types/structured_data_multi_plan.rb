# frozen_string_literal: true
require_relative "structured_data_plan"
require "ostruct"
require "json"

module Vapi
  class StructuredDataMultiPlan
  # @return [String] This is the key of the structured data plan in the catalog.
    attr_reader :key
  # @return [Vapi::StructuredDataPlan] This is an individual structured data plan in the catalog.
    attr_reader :plan
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param key [String] This is the key of the structured data plan in the catalog.
    # @param plan [Vapi::StructuredDataPlan] This is an individual structured data plan in the catalog.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::StructuredDataMultiPlan]
    def initialize(key:, plan:, additional_properties: nil)
      @key = key
      @plan = plan
      @additional_properties = additional_properties
      @_field_set = { "key": key, "plan": plan }
    end
# Deserialize a JSON object to an instance of StructuredDataMultiPlan
    #
    # @param json_object [String] 
    # @return [Vapi::StructuredDataMultiPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      unless parsed_json["plan"].nil?
        plan = parsed_json["plan"].to_json
        plan = Vapi::StructuredDataPlan.from_json(json_object: plan)
      else
        plan = nil
      end
      new(
        key: key,
        plan: plan,
        additional_properties: struct
      )
    end
# Serialize an instance of StructuredDataMultiPlan to a JSON object
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
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      Vapi::StructuredDataPlan.validate_raw(obj: obj.plan)
    end
  end
end