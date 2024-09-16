# frozen_string_literal: true

require_relative "regex_option_type"
require "ostruct"
require "json"

module Vapi
  class RegexOption
    # @return [Vapi::RegexOptionType] This is the type of the regex option. Options are:
    #  - `ignore-case`: Ignores the case of the text being matched.
    #  - `whole-word`: Matches whole words only.
    #  - `multi-line`: Matches across multiple lines.
    attr_reader :type
    # @return [Boolean] This is whether to enable the option.
    #  @default false
    attr_reader :enabled
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::RegexOptionType] This is the type of the regex option. Options are:
    #  - `ignore-case`: Ignores the case of the text being matched.
    #  - `whole-word`: Matches whole words only.
    #  - `multi-line`: Matches across multiple lines.
    # @param enabled [Boolean] This is whether to enable the option.
    #  @default false
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::RegexOption]
    def initialize(type:, enabled:, additional_properties: nil)
      @type = type
      @enabled = enabled
      @additional_properties = additional_properties
      @_field_set = { "type": type, "enabled": enabled }
    end

    # Deserialize a JSON object to an instance of RegexOption
    #
    # @param json_object [String]
    # @return [Vapi::RegexOption]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      enabled = parsed_json["enabled"]
      new(
        type: type,
        enabled: enabled,
        additional_properties: struct
      )
    end

    # Serialize an instance of RegexOption to a JSON object
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
      obj.type.is_a?(Vapi::RegexOptionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.enabled.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
    end
  end
end
