# frozen_string_literal: true

require_relative "backoff_plan"
require "ostruct"
require "json"

module Vapi
  class Server
    # @return [Float] This is the timeout in seconds for the request. Defaults to 20 seconds.
    #  @default 20
    attr_reader :timeout_seconds
    # @return [String] This is where the request will be sent.
    attr_reader :url
    # @return [Hash{String => Object}] These are the headers to include in the request.
    #  Each key-value pair represents a header name and its value.
    attr_reader :headers
    # @return [Vapi::BackoffPlan] This is the backoff plan if the request fails. Defaults to undefined (the
    #  request will not be retried).
    #  @default undefined (the request will not be retried)
    attr_reader :backoff_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param timeout_seconds [Float] This is the timeout in seconds for the request. Defaults to 20 seconds.
    #  @default 20
    # @param url [String] This is where the request will be sent.
    # @param headers [Hash{String => Object}] These are the headers to include in the request.
    #  Each key-value pair represents a header name and its value.
    # @param backoff_plan [Vapi::BackoffPlan] This is the backoff plan if the request fails. Defaults to undefined (the
    #  request will not be retried).
    #  @default undefined (the request will not be retried)
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Server]
    def initialize(timeout_seconds: OMIT, url: OMIT, headers: OMIT, backoff_plan: OMIT, additional_properties: nil)
      @timeout_seconds = timeout_seconds if timeout_seconds != OMIT
      @url = url if url != OMIT
      @headers = headers if headers != OMIT
      @backoff_plan = backoff_plan if backoff_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "timeoutSeconds": timeout_seconds,
        "url": url,
        "headers": headers,
        "backoffPlan": backoff_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Server
    #
    # @param json_object [String]
    # @return [Vapi::Server]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      timeout_seconds = parsed_json["timeoutSeconds"]
      url = parsed_json["url"]
      headers = parsed_json["headers"]
      if parsed_json["backoffPlan"].nil?
        backoff_plan = nil
      else
        backoff_plan = parsed_json["backoffPlan"].to_json
        backoff_plan = Vapi::BackoffPlan.from_json(json_object: backoff_plan)
      end
      new(
        timeout_seconds: timeout_seconds,
        url: url,
        headers: headers,
        backoff_plan: backoff_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of Server to a JSON object
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
      obj.timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
      obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.headers&.is_a?(Hash) != false || raise("Passed value for field obj.headers is not the expected type, validation failed.")
      obj.backoff_plan.nil? || Vapi::BackoffPlan.validate_raw(obj: obj.backoff_plan)
    end
  end
end
