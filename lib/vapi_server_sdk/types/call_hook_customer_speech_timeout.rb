# frozen_string_literal: true

require_relative "call_hook_customer_speech_timeout_do_item"
require_relative "customer_speech_timeout_options"
require "ostruct"
require "json"

module Vapi
  class CallHookCustomerSpeechTimeout
    # @return [String] Must be either "customer.speech.timeout" or match the pattern
    #  "customer.speech.timeout[property=value]"
    attr_reader :on
    # @return [Array<Vapi::CallHookCustomerSpeechTimeoutDoItem>] This is the set of actions to perform when the hook triggers
    attr_reader :do_
    # @return [Vapi::CustomerSpeechTimeoutOptions] This is the set of filters that must match for the hook to trigger
    attr_reader :options
    # @return [String] This is the name of the hook, it can be set by the user to identify the hook.
    #  If no name is provided, the hook will be auto generated as UUID.
    #  @default UUID
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param on [String] Must be either "customer.speech.timeout" or match the pattern
    #  "customer.speech.timeout[property=value]"
    # @param do_ [Array<Vapi::CallHookCustomerSpeechTimeoutDoItem>] This is the set of actions to perform when the hook triggers
    # @param options [Vapi::CustomerSpeechTimeoutOptions] This is the set of filters that must match for the hook to trigger
    # @param name [String] This is the name of the hook, it can be set by the user to identify the hook.
    #  If no name is provided, the hook will be auto generated as UUID.
    #  @default UUID
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CallHookCustomerSpeechTimeout]
    def initialize(on:, do_:, options: OMIT, name: OMIT, additional_properties: nil)
      @on = on
      @do_ = do_
      @options = options if options != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "on": on, "do": do_, "options": options, "name": name }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CallHookCustomerSpeechTimeout
    #
    # @param json_object [String]
    # @return [Vapi::CallHookCustomerSpeechTimeout]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      on = parsed_json["on"]
      do_ = parsed_json["do"]&.map do |item|
        item = item.to_json
        Vapi::CallHookCustomerSpeechTimeoutDoItem.from_json(json_object: item)
      end
      if parsed_json["options"].nil?
        options = nil
      else
        options = parsed_json["options"].to_json
        options = Vapi::CustomerSpeechTimeoutOptions.from_json(json_object: options)
      end
      name = parsed_json["name"]
      new(
        on: on,
        do_: do_,
        options: options,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of CallHookCustomerSpeechTimeout to a JSON object
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
      obj.on.is_a?(String) != false || raise("Passed value for field obj.on is not the expected type, validation failed.")
      obj.do_.is_a?(Array) != false || raise("Passed value for field obj.do_ is not the expected type, validation failed.")
      obj.options.nil? || Vapi::CustomerSpeechTimeoutOptions.validate_raw(obj: obj.options)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
