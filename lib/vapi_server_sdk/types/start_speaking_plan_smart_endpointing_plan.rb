# frozen_string_literal: true
require "json"
require_relative "vapi_smart_endpointing_plan"
require_relative "livekit_smart_endpointing_plan"
require_relative "custom_endpointing_model_smart_endpointing_plan"

module Vapi
# This is the plan for smart endpointing. Pick between Vapi smart endpointing or
#  LiveKit smart endpointing (or nothing). We strongly recommend using livekit
#  endpointing when working in English. LiveKit endpointing is not supported in
#  other languages, yet.
#  If this is set, it will override and take precedence over
#  `transcriptionEndpointingPlan`.
#  This plan will still be overridden by any matching `customEndpointingRules`.
  class StartSpeakingPlanSmartEndpointingPlan


# Deserialize a JSON object to an instance of
#  StartSpeakingPlanSmartEndpointingPlan
    #
    # @param json_object [String] 
    # @return [Vapi::StartSpeakingPlanSmartEndpointingPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::VapiSmartEndpointingPlan.validate_raw(obj: struct)
        unless struct.nil?
  return Vapi::VapiSmartEndpointingPlan.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vapi::LivekitSmartEndpointingPlan.validate_raw(obj: struct)
        unless struct.nil?
  return Vapi::LivekitSmartEndpointingPlan.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vapi::CustomEndpointingModelSmartEndpointingPlan.validate_raw(obj: struct)
        unless struct.nil?
  return Vapi::CustomEndpointingModelSmartEndpointingPlan.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vapi::VapiSmartEndpointingPlan.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::LivekitSmartEndpointingPlan.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CustomEndpointingModelSmartEndpointingPlan.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end