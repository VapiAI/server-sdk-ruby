# frozen_string_literal: true
require_relative "regex_option"
require "ostruct"
require "json"

module Vapi
  class BothCustomEndpointingRule
  # @return [String] This is the regex pattern to match the assistant's message.
#  Note:
#  - This works by using the `RegExp.test` method in Node.JS. Eg.
#  `/hello/.test("hello there")` will return `true`.
#  Hot tip:
#  - In JavaScript, escape `\` when sending the regex pattern. Eg. `"hello\sthere"`
#  will be sent over the wire as `"hellosthere"`. Send `"hello\\sthere"` instead.
#  - `RegExp.test` does substring matching, so `/cat/.test("I love cats")` will
#  return `true`. To do full string matching, send "^cat$".
    attr_reader :assistant_regex
  # @return [Array<Vapi::RegexOption>] These are the options for the assistant's message regex match. Defaults to all
#  disabled.
#  @default []
    attr_reader :assistant_regex_options
  # @return [String] 
    attr_reader :customer_regex
  # @return [Array<Vapi::RegexOption>] These are the options for the customer's message regex match. Defaults to all
#  disabled.
#  @default []
    attr_reader :customer_regex_options
  # @return [Float] This is the endpointing timeout in seconds, if the rule is matched.
    attr_reader :timeout_seconds
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param assistant_regex [String] This is the regex pattern to match the assistant's message.
#  Note:
#  - This works by using the `RegExp.test` method in Node.JS. Eg.
#  `/hello/.test("hello there")` will return `true`.
#  Hot tip:
#  - In JavaScript, escape `\` when sending the regex pattern. Eg. `"hello\sthere"`
#  will be sent over the wire as `"hellosthere"`. Send `"hello\\sthere"` instead.
#  - `RegExp.test` does substring matching, so `/cat/.test("I love cats")` will
#  return `true`. To do full string matching, send "^cat$".
    # @param assistant_regex_options [Array<Vapi::RegexOption>] These are the options for the assistant's message regex match. Defaults to all
#  disabled.
#  @default []
    # @param customer_regex [String] 
    # @param customer_regex_options [Array<Vapi::RegexOption>] These are the options for the customer's message regex match. Defaults to all
#  disabled.
#  @default []
    # @param timeout_seconds [Float] This is the endpointing timeout in seconds, if the rule is matched.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::BothCustomEndpointingRule]
    def initialize(assistant_regex:, assistant_regex_options: OMIT, customer_regex:, customer_regex_options: OMIT, timeout_seconds:, additional_properties: nil)
      @assistant_regex = assistant_regex
      @assistant_regex_options = assistant_regex_options if assistant_regex_options != OMIT
      @customer_regex = customer_regex
      @customer_regex_options = customer_regex_options if customer_regex_options != OMIT
      @timeout_seconds = timeout_seconds
      @additional_properties = additional_properties
      @_field_set = { "assistantRegex": assistant_regex, "assistantRegexOptions": assistant_regex_options, "customerRegex": customer_regex, "customerRegexOptions": customer_regex_options, "timeoutSeconds": timeout_seconds }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BothCustomEndpointingRule
    #
    # @param json_object [String] 
    # @return [Vapi::BothCustomEndpointingRule]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      assistant_regex = parsed_json["assistantRegex"]
      assistant_regex_options = parsed_json["assistantRegexOptions"]&.map do | item |
  item = item.to_json
  Vapi::RegexOption.from_json(json_object: item)
end
      customer_regex = parsed_json["customerRegex"]
      customer_regex_options = parsed_json["customerRegexOptions"]&.map do | item |
  item = item.to_json
  Vapi::RegexOption.from_json(json_object: item)
end
      timeout_seconds = parsed_json["timeoutSeconds"]
      new(
        assistant_regex: assistant_regex,
        assistant_regex_options: assistant_regex_options,
        customer_regex: customer_regex,
        customer_regex_options: customer_regex_options,
        timeout_seconds: timeout_seconds,
        additional_properties: struct
      )
    end
# Serialize an instance of BothCustomEndpointingRule to a JSON object
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
      obj.assistant_regex.is_a?(String) != false || raise("Passed value for field obj.assistant_regex is not the expected type, validation failed.")
      obj.assistant_regex_options&.is_a?(Array) != false || raise("Passed value for field obj.assistant_regex_options is not the expected type, validation failed.")
      obj.customer_regex.is_a?(String) != false || raise("Passed value for field obj.customer_regex is not the expected type, validation failed.")
      obj.customer_regex_options&.is_a?(Array) != false || raise("Passed value for field obj.customer_regex_options is not the expected type, validation failed.")
      obj.timeout_seconds.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
    end
  end
end