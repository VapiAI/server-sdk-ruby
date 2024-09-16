# frozen_string_literal: true

require_relative "transcription_endpointing_plan"
require "ostruct"
require "json"

module Vapi
  class StartSpeakingPlan
    # @return [Float] This is how long assistant waits before speaking. Defaults to 0.4.
    #  This is the minimum it will wait but if there is latency is the pipeline, this
    #  minimum will be exceeded. This is really a stopgap in case the pipeline is
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
    # @return [Boolean] This determines if a customer speech is considered done (endpointing) using the
    #  VAP model on customer's speech. This is good for middle-of-thought detection.
    #  Once an endpoint is triggered, the request is sent to `assistant.model`.
    #  Default `false` since experimental.
    #  @default false
    attr_reader :smart_endpointing_enabled
    # @return [Vapi::TranscriptionEndpointingPlan] This determines how a customer speech is considered done (endpointing) using the
    #  transcription of customer's speech.
    #  Once an endpoint is triggered, the request is sent to `assistant.model`.
    attr_reader :transcription_endpointing_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param wait_seconds [Float] This is how long assistant waits before speaking. Defaults to 0.4.
    #  This is the minimum it will wait but if there is latency is the pipeline, this
    #  minimum will be exceeded. This is really a stopgap in case the pipeline is
    #  moving too fast.
    #  Example:
    #  - If model generates tokens and voice generates bytes within 100ms, the pipeline
    #  still waits 300ms before outputting speech.
    #  Usage:
    #  - If the customer is taking long pauses, set this to a higher value.
    #  - If the assistant is accidentally jumping in too much, set this to a higher
    #  value.
    #  @default 0.4
    # @param smart_endpointing_enabled [Boolean] This determines if a customer speech is considered done (endpointing) using the
    #  VAP model on customer's speech. This is good for middle-of-thought detection.
    #  Once an endpoint is triggered, the request is sent to `assistant.model`.
    #  Default `false` since experimental.
    #  @default false
    # @param transcription_endpointing_plan [Vapi::TranscriptionEndpointingPlan] This determines how a customer speech is considered done (endpointing) using the
    #  transcription of customer's speech.
    #  Once an endpoint is triggered, the request is sent to `assistant.model`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::StartSpeakingPlan]
    def initialize(wait_seconds: OMIT, smart_endpointing_enabled: OMIT, transcription_endpointing_plan: OMIT,
                   additional_properties: nil)
      @wait_seconds = wait_seconds if wait_seconds != OMIT
      @smart_endpointing_enabled = smart_endpointing_enabled if smart_endpointing_enabled != OMIT
      @transcription_endpointing_plan = transcription_endpointing_plan if transcription_endpointing_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "waitSeconds": wait_seconds,
        "smartEndpointingEnabled": smart_endpointing_enabled,
        "transcriptionEndpointingPlan": transcription_endpointing_plan
      }.reject do |_k, v|
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
      smart_endpointing_enabled = parsed_json["smartEndpointingEnabled"]
      if parsed_json["transcriptionEndpointingPlan"].nil?
        transcription_endpointing_plan = nil
      else
        transcription_endpointing_plan = parsed_json["transcriptionEndpointingPlan"].to_json
        transcription_endpointing_plan = Vapi::TranscriptionEndpointingPlan.from_json(json_object: transcription_endpointing_plan)
      end
      new(
        wait_seconds: wait_seconds,
        smart_endpointing_enabled: smart_endpointing_enabled,
        transcription_endpointing_plan: transcription_endpointing_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of StartSpeakingPlan to a JSON object
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
      obj.wait_seconds&.is_a?(Float) != false || raise("Passed value for field obj.wait_seconds is not the expected type, validation failed.")
      obj.smart_endpointing_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.smart_endpointing_enabled is not the expected type, validation failed.")
      obj.transcription_endpointing_plan.nil? || Vapi::TranscriptionEndpointingPlan.validate_raw(obj: obj.transcription_endpointing_plan)
    end
  end
end
