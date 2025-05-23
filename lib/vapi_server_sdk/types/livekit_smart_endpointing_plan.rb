# frozen_string_literal: true

require_relative "livekit_smart_endpointing_plan_provider"
require "ostruct"
require "json"

module Vapi
  class LivekitSmartEndpointingPlan
    # @return [Vapi::LivekitSmartEndpointingPlanProvider] This is the provider for the smart endpointing plan.
    attr_reader :provider
    # @return [String] This expression describes how long the bot will wait to start speaking based on
    #  the likelihood that the user has reached an endpoint.
    #  This is a millisecond valued function. It maps probabilities (real numbers on
    #  [0,1]) to milliseconds that the bot should wait before speaking ([0, \infty]).
    #  Any negative values that are returned are set to zero (the bot can't start
    #  talking in the past).
    #  A probability of zero represents very high confidence that the caller has
    #  stopped speaking, and would like the bot to speak to them. A probability of one
    #  represents very high confidence that the caller is still speaking.
    #  Under the hood, this is parsed into a mathjs expression. Whatever you use to
    #  write your expression needs to be valid with respect to mathjs
    #  @default "20 + 500 * sqrt(x) + 2500 * x^3"
    attr_reader :wait_function
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [Vapi::LivekitSmartEndpointingPlanProvider] This is the provider for the smart endpointing plan.
    # @param wait_function [String] This expression describes how long the bot will wait to start speaking based on
    #  the likelihood that the user has reached an endpoint.
    #  This is a millisecond valued function. It maps probabilities (real numbers on
    #  [0,1]) to milliseconds that the bot should wait before speaking ([0, \infty]).
    #  Any negative values that are returned are set to zero (the bot can't start
    #  talking in the past).
    #  A probability of zero represents very high confidence that the caller has
    #  stopped speaking, and would like the bot to speak to them. A probability of one
    #  represents very high confidence that the caller is still speaking.
    #  Under the hood, this is parsed into a mathjs expression. Whatever you use to
    #  write your expression needs to be valid with respect to mathjs
    #  @default "20 + 500 * sqrt(x) + 2500 * x^3"
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::LivekitSmartEndpointingPlan]
    def initialize(provider:, wait_function: OMIT, additional_properties: nil)
      @provider = provider
      @wait_function = wait_function if wait_function != OMIT
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "waitFunction": wait_function }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of LivekitSmartEndpointingPlan
    #
    # @param json_object [String]
    # @return [Vapi::LivekitSmartEndpointingPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      wait_function = parsed_json["waitFunction"]
      new(
        provider: provider,
        wait_function: wait_function,
        additional_properties: struct
      )
    end

    # Serialize an instance of LivekitSmartEndpointingPlan to a JSON object
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
      obj.provider.is_a?(Vapi::LivekitSmartEndpointingPlanProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.wait_function&.is_a?(String) != false || raise("Passed value for field obj.wait_function is not the expected type, validation failed.")
    end
  end
end
