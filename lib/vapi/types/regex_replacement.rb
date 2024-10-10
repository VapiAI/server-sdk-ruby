# frozen_string_literal: true

require_relative "regex_option"
require "ostruct"
require "json"

module Vapi
  class RegexReplacement
    # @return [String] This is the regex pattern to replace.
    attr_reader :regex
    # @return [Array<Vapi::RegexOption>] These are the options for the regex replacement. Default all options are
    #  disabled.
    #  @default []
    attr_reader :options
    # @return [String] This is the value that will replace the match.
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param regex [String] This is the regex pattern to replace.
    # @param options [Array<Vapi::RegexOption>] These are the options for the regex replacement. Default all options are
    #  disabled.
    #  @default []
    # @param value [String] This is the value that will replace the match.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::RegexReplacement]
    def initialize(regex:, value:, options: OMIT, additional_properties: nil)
      @regex = regex
      @options = options if options != OMIT
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "regex": regex, "options": options, "value": value }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RegexReplacement
    #
    # @param json_object [String]
    # @return [Vapi::RegexReplacement]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      regex = parsed_json["regex"]
      options = parsed_json["options"]&.map do |item|
        item = item.to_json
        Vapi::RegexOption.from_json(json_object: item)
      end
      value = parsed_json["value"]
      new(
        regex: regex,
        options: options,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of RegexReplacement to a JSON object
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
      obj.regex.is_a?(String) != false || raise("Passed value for field obj.regex is not the expected type, validation failed.")
      obj.options&.is_a?(Array) != false || raise("Passed value for field obj.options is not the expected type, validation failed.")
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
