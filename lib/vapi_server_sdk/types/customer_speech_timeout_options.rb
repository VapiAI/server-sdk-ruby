# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class CustomerSpeechTimeoutOptions
    # @return [Float] This is the timeout in seconds before action is triggered.
    #  The clock starts when the assistant finishes speaking and remains active until
    #  the user speaks.
    #  @default 7.5
    attr_reader :timeout_seconds
    # @return [Float] This is the maximum number of times the hook will trigger in a call.
    #  @default 3
    attr_reader :trigger_max_count
    # @return [Hash{String => Object}] This is whether the counter for hook trigger resets the user speaks.
    #  @default never
    attr_reader :trigger_reset_mode
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param timeout_seconds [Float] This is the timeout in seconds before action is triggered.
    #  The clock starts when the assistant finishes speaking and remains active until
    #  the user speaks.
    #  @default 7.5
    # @param trigger_max_count [Float] This is the maximum number of times the hook will trigger in a call.
    #  @default 3
    # @param trigger_reset_mode [Hash{String => Object}] This is whether the counter for hook trigger resets the user speaks.
    #  @default never
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CustomerSpeechTimeoutOptions]
    def initialize(timeout_seconds:, trigger_max_count: OMIT, trigger_reset_mode: OMIT, additional_properties: nil)
      @timeout_seconds = timeout_seconds
      @trigger_max_count = trigger_max_count if trigger_max_count != OMIT
      @trigger_reset_mode = trigger_reset_mode if trigger_reset_mode != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "timeoutSeconds": timeout_seconds,
        "triggerMaxCount": trigger_max_count,
        "triggerResetMode": trigger_reset_mode
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CustomerSpeechTimeoutOptions
    #
    # @param json_object [String]
    # @return [Vapi::CustomerSpeechTimeoutOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      timeout_seconds = parsed_json["timeoutSeconds"]
      trigger_max_count = parsed_json["triggerMaxCount"]
      trigger_reset_mode = parsed_json["triggerResetMode"]
      new(
        timeout_seconds: timeout_seconds,
        trigger_max_count: trigger_max_count,
        trigger_reset_mode: trigger_reset_mode,
        additional_properties: struct
      )
    end

    # Serialize an instance of CustomerSpeechTimeoutOptions to a JSON object
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
      obj.timeout_seconds.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
      obj.trigger_max_count&.is_a?(Float) != false || raise("Passed value for field obj.trigger_max_count is not the expected type, validation failed.")
      obj.trigger_reset_mode&.is_a?(Hash) != false || raise("Passed value for field obj.trigger_reset_mode is not the expected type, validation failed.")
    end
  end
end
