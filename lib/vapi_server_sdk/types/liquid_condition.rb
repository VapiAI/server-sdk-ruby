# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class LiquidCondition
    # @return [String] This is the Liquid template that must return exactly "true" or "false" as a
    #  string.
    #  The template is evaluated and the entire output must be either "true" or "false"
    #  - nothing else.
    #  Available variables:
    #  - `messages`: Array of recent messages in OpenAI chat completions format
    #  (ChatCompletionMessageParam[])
    #  Each message has properties like: role ('user', 'assistant', 'system'),
    #  content (string), etc.
    #  - `now`: Current timestamp in milliseconds (built-in Liquid variable)
    #  - Any assistant variable values (e.g., `userName`, `accountStatus`)
    #  Useful Liquid filters for messages:
    #  - `messages | last: 5` - Get the 5 most recent messages
    #  - `messages | where: 'role', 'user'` - Filter to only user messages
    #  - `messages | reverse` - Reverse the order of messages
    attr_reader :liquid
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param liquid [String] This is the Liquid template that must return exactly "true" or "false" as a
    #  string.
    #  The template is evaluated and the entire output must be either "true" or "false"
    #  - nothing else.
    #  Available variables:
    #  - `messages`: Array of recent messages in OpenAI chat completions format
    #  (ChatCompletionMessageParam[])
    #  Each message has properties like: role ('user', 'assistant', 'system'),
    #  content (string), etc.
    #  - `now`: Current timestamp in milliseconds (built-in Liquid variable)
    #  - Any assistant variable values (e.g., `userName`, `accountStatus`)
    #  Useful Liquid filters for messages:
    #  - `messages | last: 5` - Get the 5 most recent messages
    #  - `messages | where: 'role', 'user'` - Filter to only user messages
    #  - `messages | reverse` - Reverse the order of messages
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::LiquidCondition]
    def initialize(liquid:, additional_properties: nil)
      @liquid = liquid
      @additional_properties = additional_properties
      @_field_set = { "liquid": liquid }
    end

    # Deserialize a JSON object to an instance of LiquidCondition
    #
    # @param json_object [String]
    # @return [Vapi::LiquidCondition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      liquid = parsed_json["liquid"]
      new(liquid: liquid, additional_properties: struct)
    end

    # Serialize an instance of LiquidCondition to a JSON object
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
      obj.liquid.is_a?(String) != false || raise("Passed value for field obj.liquid is not the expected type, validation failed.")
    end
  end
end
