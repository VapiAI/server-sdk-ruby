# frozen_string_literal: true

require_relative "auto_reload_plan"
require "ostruct"
require "json"

module Vapi
  class AutoReloadPlanDto
    # @return [Vapi::AutoReloadPlan] This is the auto reload plan to be configured for the subscription.
    #  It can be null if no auto reload plan is set.
    attr_reader :auto_reload_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param auto_reload_plan [Vapi::AutoReloadPlan] This is the auto reload plan to be configured for the subscription.
    #  It can be null if no auto reload plan is set.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AutoReloadPlanDto]
    def initialize(auto_reload_plan: OMIT, additional_properties: nil)
      @auto_reload_plan = auto_reload_plan if auto_reload_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "autoReloadPlan": auto_reload_plan }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AutoReloadPlanDto
    #
    # @param json_object [String]
    # @return [Vapi::AutoReloadPlanDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["autoReloadPlan"].nil?
        auto_reload_plan = nil
      else
        auto_reload_plan = parsed_json["autoReloadPlan"].to_json
        auto_reload_plan = Vapi::AutoReloadPlan.from_json(json_object: auto_reload_plan)
      end
      new(auto_reload_plan: auto_reload_plan, additional_properties: struct)
    end

    # Serialize an instance of AutoReloadPlanDto to a JSON object
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
      obj.auto_reload_plan.nil? || Vapi::AutoReloadPlan.validate_raw(obj: obj.auto_reload_plan)
    end
  end
end
