# frozen_string_literal: true
require_relative "start_speaking_plan_smart_endpointing_enabled"
require_relative "start_speaking_plan_smart_endpointing_plan"
require_relative "start_speaking_plan_custom_endpointing_rules_item"
require_relative "transcription_endpointing_plan"
require "ostruct"
require "json"

module Vapi
  class StartSpeakingPlan
  # @return [Float] This is how long assistant waits before speaking. Defaults to 0.4.
#  This is the minimum it will wait but if there is latency is the pipeline, this
#  minimum will be exceeded. This is intended as a stopgap in case the pipeline is
#  moving too fast.
#  Example:
#  - If model generates tokens and voice generates bytes within 100ms, the pipeline
#  still waits 300ms before outputting speech.
#  Usage:
#  - If the customer is taking long pauses, set this to a higher value.
#  - If the assistant is accidentally jumping in too much, set this to a higher
#  value.
#  @default 0.4
    attr_reader :wait_seconds
  # @return [Vapi::StartSpeakingPlanSmartEndpointingEnabled] 
    attr_reader :smart_endpointing_enabled
  # @return [Vapi::StartSpeakingPlanSmartEndpointingPlan] This is the plan for smart endpointing. Pick between Vapi smart endpointing or
#  LiveKit smart endpointing (or nothing). We strongly recommend using livekit
#  endpointing when working in English. LiveKit endpointing is not supported in
#  other languages, yet.
#  If this is set, it will override and take precedence over
#  `transcriptionEndpointingPlan`.
#  This plan will still be overridden by any matching `customEndpointingRules`.
    attr_reader :smart_endpointing_plan
  # @return [Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>] These are the custom endpointing rules to set an endpointing timeout based on a
#  regex on the customer's speech or the assistant's last message.
#  Usage:
#  - If you have yes/no questions like "are you interested in a loan?", you can set
#  a shorter timeout.
#  - If you have questions where the customer may pause to look up information like
#  "what's my account number?", you can set a longer timeout.
#  - If you want to wait longer while customer is enumerating a list of numbers,
#  you can set a longer timeout.
#  These rules have the highest precedence and will override both
#  `smartEndpointingPlan` and `transcriptionEndpointingPlan` when a rule is
#  matched.
#  The rules are evaluated in order and the first one that matches will be used.
#  Order of precedence for endpointing:
#  1. customEndpointingRules (if any match)
#  2. smartEndpointingPlan (if set)
#  3. transcriptionEndpointingPlan
#  @default []
    attr_reader :custom_endpointing_rules
  # @return [Vapi::TranscriptionEndpointingPlan] This determines how a customer speech is considered done (endpointing) using the
#  transcription of customer's speech.
#  Once an endpoint is triggered, the request is sent to `assistant.model`.
#  Note: This plan is only used if `smartEndpointingPlan` is not set. If both are
#  provided, `smartEndpointingPlan` takes precedence.
#  This plan will also be overridden by any matching `customEndpointingRules`.
    attr_reader :transcription_endpointing_plan
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param wait_seconds [Float] This is how long assistant waits before speaking. Defaults to 0.4.
#  This is the minimum it will wait but if there is latency is the pipeline, this
#  minimum will be exceeded. This is intended as a stopgap in case the pipeline is
#  moving too fast.
#  Example:
#  - If model generates tokens and voice generates bytes within 100ms, the pipeline
#  still waits 300ms before outputting speech.
#  Usage:
#  - If the customer is taking long pauses, set this to a higher value.
#  - If the assistant is accidentally jumping in too much, set this to a higher
#  value.
#  @default 0.4
    # @param smart_endpointing_enabled [Vapi::StartSpeakingPlanSmartEndpointingEnabled] 
    # @param smart_endpointing_plan [Vapi::StartSpeakingPlanSmartEndpointingPlan] This is the plan for smart endpointing. Pick between Vapi smart endpointing or
#  LiveKit smart endpointing (or nothing). We strongly recommend using livekit
#  endpointing when working in English. LiveKit endpointing is not supported in
#  other languages, yet.
#  If this is set, it will override and take precedence over
#  `transcriptionEndpointingPlan`.
#  This plan will still be overridden by any matching `customEndpointingRules`.
    # @param custom_endpointing_rules [Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>] These are the custom endpointing rules to set an endpointing timeout based on a
#  regex on the customer's speech or the assistant's last message.
#  Usage:
#  - If you have yes/no questions like "are you interested in a loan?", you can set
#  a shorter timeout.
#  - If you have questions where the customer may pause to look up information like
#  "what's my account number?", you can set a longer timeout.
#  - If you want to wait longer while customer is enumerating a list of numbers,
#  you can set a longer timeout.
#  These rules have the highest precedence and will override both
#  `smartEndpointingPlan` and `transcriptionEndpointingPlan` when a rule is
#  matched.
#  The rules are evaluated in order and the first one that matches will be used.
#  Order of precedence for endpointing:
#  1. customEndpointingRules (if any match)
#  2. smartEndpointingPlan (if set)
#  3. transcriptionEndpointingPlan
#  @default []
    # @param transcription_endpointing_plan [Vapi::TranscriptionEndpointingPlan] This determines how a customer speech is considered done (endpointing) using the
#  transcription of customer's speech.
#  Once an endpoint is triggered, the request is sent to `assistant.model`.
#  Note: This plan is only used if `smartEndpointingPlan` is not set. If both are
#  provided, `smartEndpointingPlan` takes precedence.
#  This plan will also be overridden by any matching `customEndpointingRules`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::StartSpeakingPlan]
    def initialize(wait_seconds: OMIT, smart_endpointing_enabled: OMIT, smart_endpointing_plan: OMIT, custom_endpointing_rules: OMIT, transcription_endpointing_plan: OMIT, additional_properties: nil)
      @wait_seconds = wait_seconds if wait_seconds != OMIT
      @smart_endpointing_enabled = smart_endpointing_enabled if smart_endpointing_enabled != OMIT
      @smart_endpointing_plan = smart_endpointing_plan if smart_endpointing_plan != OMIT
      @custom_endpointing_rules = custom_endpointing_rules if custom_endpointing_rules != OMIT
      @transcription_endpointing_plan = transcription_endpointing_plan if transcription_endpointing_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "waitSeconds": wait_seconds, "smartEndpointingEnabled": smart_endpointing_enabled, "smartEndpointingPlan": smart_endpointing_plan, "customEndpointingRules": custom_endpointing_rules, "transcriptionEndpointingPlan": transcription_endpointing_plan }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of StartSpeakingPlan
    #
    # @param json_object [String] 
    # @return [Vapi::StartSpeakingPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      wait_seconds = parsed_json["waitSeconds"]
      unless parsed_json["smartEndpointingEnabled"].nil?
        smart_endpointing_enabled = parsed_json["smartEndpointingEnabled"].to_json
        smart_endpointing_enabled = Vapi::StartSpeakingPlanSmartEndpointingEnabled.from_json(json_object: smart_endpointing_enabled)
      else
        smart_endpointing_enabled = nil
      end
      unless parsed_json["smartEndpointingPlan"].nil?
        smart_endpointing_plan = parsed_json["smartEndpointingPlan"].to_json
        smart_endpointing_plan = Vapi::StartSpeakingPlanSmartEndpointingPlan.from_json(json_object: smart_endpointing_plan)
      else
        smart_endpointing_plan = nil
      end
      custom_endpointing_rules = parsed_json["customEndpointingRules"]&.map do | item |
  item = item.to_json
  Vapi::StartSpeakingPlanCustomEndpointingRulesItem.from_json(json_object: item)
end
      unless parsed_json["transcriptionEndpointingPlan"].nil?
        transcription_endpointing_plan = parsed_json["transcriptionEndpointingPlan"].to_json
        transcription_endpointing_plan = Vapi::TranscriptionEndpointingPlan.from_json(json_object: transcription_endpointing_plan)
      else
        transcription_endpointing_plan = nil
      end
      new(
        wait_seconds: wait_seconds,
        smart_endpointing_enabled: smart_endpointing_enabled,
        smart_endpointing_plan: smart_endpointing_plan,
        custom_endpointing_rules: custom_endpointing_rules,
        transcription_endpointing_plan: transcription_endpointing_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of StartSpeakingPlan to a JSON object
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
      obj.wait_seconds&.is_a?(Float) != false || raise("Passed value for field obj.wait_seconds is not the expected type, validation failed.")
      obj.smart_endpointing_enabled.nil? || Vapi::StartSpeakingPlanSmartEndpointingEnabled.validate_raw(obj: obj.smart_endpointing_enabled)
      obj.smart_endpointing_plan.nil? || Vapi::StartSpeakingPlanSmartEndpointingPlan.validate_raw(obj: obj.smart_endpointing_plan)
      obj.custom_endpointing_rules&.is_a?(Array) != false || raise("Passed value for field obj.custom_endpointing_rules is not the expected type, validation failed.")
      obj.transcription_endpointing_plan.nil? || Vapi::TranscriptionEndpointingPlan.validate_raw(obj: obj.transcription_endpointing_plan)
    end
  end
end