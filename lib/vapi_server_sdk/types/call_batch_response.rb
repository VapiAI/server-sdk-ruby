# frozen_string_literal: true

require_relative "subscription_limits"
require_relative "call"
require_relative "call_batch_error"
require "ostruct"
require "json"

module Vapi
  class CallBatchResponse
    # @return [Vapi::SubscriptionLimits] Subscription limits at the end of this batch
    attr_reader :subscription_limits
    # @return [Array<Vapi::Call>] This is the list of calls that were created.
    attr_reader :results
    # @return [Array<Vapi::CallBatchError>] This is the list of calls that failed to be created.
    attr_reader :errors
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param subscription_limits [Vapi::SubscriptionLimits] Subscription limits at the end of this batch
    # @param results [Array<Vapi::Call>] This is the list of calls that were created.
    # @param errors [Array<Vapi::CallBatchError>] This is the list of calls that failed to be created.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CallBatchResponse]
    def initialize(results:, errors:, subscription_limits: OMIT, additional_properties: nil)
      @subscription_limits = subscription_limits if subscription_limits != OMIT
      @results = results
      @errors = errors
      @additional_properties = additional_properties
      @_field_set = {
        "subscriptionLimits": subscription_limits,
        "results": results,
        "errors": errors
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CallBatchResponse
    #
    # @param json_object [String]
    # @return [Vapi::CallBatchResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["subscriptionLimits"].nil?
        subscription_limits = nil
      else
        subscription_limits = parsed_json["subscriptionLimits"].to_json
        subscription_limits = Vapi::SubscriptionLimits.from_json(json_object: subscription_limits)
      end
      results = parsed_json["results"]&.map do |item|
        item = item.to_json
        Vapi::Call.from_json(json_object: item)
      end
      errors = parsed_json["errors"]&.map do |item|
        item = item.to_json
        Vapi::CallBatchError.from_json(json_object: item)
      end
      new(
        subscription_limits: subscription_limits,
        results: results,
        errors: errors,
        additional_properties: struct
      )
    end

    # Serialize an instance of CallBatchResponse to a JSON object
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
      obj.subscription_limits.nil? || Vapi::SubscriptionLimits.validate_raw(obj: obj.subscription_limits)
      obj.results.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end
