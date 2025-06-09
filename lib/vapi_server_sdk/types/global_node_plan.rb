# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class GlobalNodePlan
  # @return [Boolean] This is the flag to determine if this node is a global node
#  @default false
    attr_reader :enabled
  # @return [String] This is the condition that will be checked to determine if the global node
#  should be executed.
#  @default ''
    attr_reader :enter_condition
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param enabled [Boolean] This is the flag to determine if this node is a global node
#  @default false
    # @param enter_condition [String] This is the condition that will be checked to determine if the global node
#  should be executed.
#  @default ''
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GlobalNodePlan]
    def initialize(enabled: OMIT, enter_condition: OMIT, additional_properties: nil)
      @enabled = enabled if enabled != OMIT
      @enter_condition = enter_condition if enter_condition != OMIT
      @additional_properties = additional_properties
      @_field_set = { "enabled": enabled, "enterCondition": enter_condition }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GlobalNodePlan
    #
    # @param json_object [String] 
    # @return [Vapi::GlobalNodePlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      enabled = parsed_json["enabled"]
      enter_condition = parsed_json["enterCondition"]
      new(
        enabled: enabled,
        enter_condition: enter_condition,
        additional_properties: struct
      )
    end
# Serialize an instance of GlobalNodePlan to a JSON object
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
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.enter_condition&.is_a?(String) != false || raise("Passed value for field obj.enter_condition is not the expected type, validation failed.")
    end
  end
end