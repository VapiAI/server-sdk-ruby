# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class OrgPlan
    # @return [Array<Hash{String => Object}>]
    attr_reader :included_providers
    # @return [Float]
    attr_reader :included_minutes
    # @return [Float]
    attr_reader :cost_per_overage_minute
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param included_providers [Array<Hash{String => Object}>]
    # @param included_minutes [Float]
    # @param cost_per_overage_minute [Float]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::OrgPlan]
    def initialize(included_providers: OMIT, included_minutes: OMIT, cost_per_overage_minute: OMIT,
                   additional_properties: nil)
      @included_providers = included_providers if included_providers != OMIT
      @included_minutes = included_minutes if included_minutes != OMIT
      @cost_per_overage_minute = cost_per_overage_minute if cost_per_overage_minute != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "includedProviders": included_providers,
        "includedMinutes": included_minutes,
        "costPerOverageMinute": cost_per_overage_minute
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of OrgPlan
    #
    # @param json_object [String]
    # @return [Vapi::OrgPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      included_providers = parsed_json["includedProviders"]
      included_minutes = parsed_json["includedMinutes"]
      cost_per_overage_minute = parsed_json["costPerOverageMinute"]
      new(
        included_providers: included_providers,
        included_minutes: included_minutes,
        cost_per_overage_minute: cost_per_overage_minute,
        additional_properties: struct
      )
    end

    # Serialize an instance of OrgPlan to a JSON object
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
      obj.included_providers&.is_a?(Array) != false || raise("Passed value for field obj.included_providers is not the expected type, validation failed.")
      obj.included_minutes&.is_a?(Float) != false || raise("Passed value for field obj.included_minutes is not the expected type, validation failed.")
      obj.cost_per_overage_minute&.is_a?(Float) != false || raise("Passed value for field obj.cost_per_overage_minute is not the expected type, validation failed.")
    end
  end
end
