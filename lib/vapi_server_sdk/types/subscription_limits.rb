# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class SubscriptionLimits
    # @return [Boolean] True if this call was blocked by the Call Concurrency limit
    attr_reader :concurrency_blocked
    # @return [Float] Account Call Concurrency limit
    attr_reader :concurrency_limit
    # @return [Float] Incremental number of concurrent calls that will be allowed, including this call
    attr_reader :remaining_concurrent_calls
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param concurrency_blocked [Boolean] True if this call was blocked by the Call Concurrency limit
    # @param concurrency_limit [Float] Account Call Concurrency limit
    # @param remaining_concurrent_calls [Float] Incremental number of concurrent calls that will be allowed, including this call
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SubscriptionLimits]
    def initialize(concurrency_blocked: OMIT, concurrency_limit: OMIT, remaining_concurrent_calls: OMIT,
                   additional_properties: nil)
      @concurrency_blocked = concurrency_blocked if concurrency_blocked != OMIT
      @concurrency_limit = concurrency_limit if concurrency_limit != OMIT
      @remaining_concurrent_calls = remaining_concurrent_calls if remaining_concurrent_calls != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "concurrencyBlocked": concurrency_blocked,
        "concurrencyLimit": concurrency_limit,
        "remainingConcurrentCalls": remaining_concurrent_calls
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SubscriptionLimits
    #
    # @param json_object [String]
    # @return [Vapi::SubscriptionLimits]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      concurrency_blocked = parsed_json["concurrencyBlocked"]
      concurrency_limit = parsed_json["concurrencyLimit"]
      remaining_concurrent_calls = parsed_json["remainingConcurrentCalls"]
      new(
        concurrency_blocked: concurrency_blocked,
        concurrency_limit: concurrency_limit,
        remaining_concurrent_calls: remaining_concurrent_calls,
        additional_properties: struct
      )
    end

    # Serialize an instance of SubscriptionLimits to a JSON object
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
      obj.concurrency_blocked&.is_a?(Boolean) != false || raise("Passed value for field obj.concurrency_blocked is not the expected type, validation failed.")
      obj.concurrency_limit&.is_a?(Float) != false || raise("Passed value for field obj.concurrency_limit is not the expected type, validation failed.")
      obj.remaining_concurrent_calls&.is_a?(Float) != false || raise("Passed value for field obj.remaining_concurrent_calls is not the expected type, validation failed.")
    end
  end
end
