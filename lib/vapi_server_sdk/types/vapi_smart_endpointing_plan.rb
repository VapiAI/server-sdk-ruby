# frozen_string_literal: true
require_relative "vapi_smart_endpointing_plan_provider"
require "ostruct"
require "json"

module Vapi
  class VapiSmartEndpointingPlan
  # @return [Vapi::VapiSmartEndpointingPlanProvider] This is the provider for the smart endpointing plan.
    attr_reader :provider
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [Vapi::VapiSmartEndpointingPlanProvider] This is the provider for the smart endpointing plan.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VapiSmartEndpointingPlan]
    def initialize(provider:, additional_properties: nil)
      @provider = provider
      @additional_properties = additional_properties
      @_field_set = { "provider": provider }
    end
# Deserialize a JSON object to an instance of VapiSmartEndpointingPlan
    #
    # @param json_object [String] 
    # @return [Vapi::VapiSmartEndpointingPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      new(provider: provider, additional_properties: struct)
    end
# Serialize an instance of VapiSmartEndpointingPlan to a JSON object
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
      obj.provider.is_a?(Vapi::VapiSmartEndpointingPlanProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
    end
  end
end