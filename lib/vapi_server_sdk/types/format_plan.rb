# frozen_string_literal: true

require_relative "format_plan_replacements_item"
require_relative "format_plan_formatters_enabled_item"
require "ostruct"
require "json"

module Vapi
  class FormatPlan
    # @return [Boolean] This determines whether the chunk is formatted before being sent to the voice
    #  provider. This helps with enunciation. This includes phone numbers, emails and
    #  addresses. Default `true`.
    #  Usage:
    #  - To rely on the voice provider's formatting logic, set this to `false`.
    #  If `voice.chunkPlan.enabled` is `false`, this is automatically `false` since
    #  there's no chunk to format.
    #  @default true
    attr_reader :enabled
    # @return [Float] This is the cutoff after which a number is converted to individual digits
    #  instead of being spoken as words.
    #  Example:
    #  - If cutoff 2025, "12345" is converted to "1 2 3 4 5" while "1200" is converted
    #  to "twelve hundred".
    #  Usage:
    #  - If your use case doesn't involve IDs like zip codes, set this to a high value.
    #  - If your use case involves IDs that are shorter than 5 digits, set this to a
    #  lower value.
    #  @default 2025
    attr_reader :number_to_digits_cutoff
    # @return [Array<Vapi::FormatPlanReplacementsItem>] These are the custom replacements you can make to the chunk before it is sent to
    #  the voice provider.
    #  Usage:
    #  - To replace a specific word or phrase with a different word or phrase, use the
    #  `ExactReplacement` type. Eg. `{ type: 'exact', key: 'hello', value: 'hi' }`
    #  - To replace a word or phrase that matches a pattern, use the `RegexReplacement`
    #  type. Eg. `{ type: 'regex', regex: '\\b[a-zA-Z]{5}\\b', value: 'hi' }`
    #  @default []
    attr_reader :replacements
    # @return [Array<Vapi::FormatPlanFormattersEnabledItem>] List of formatters to apply. If not provided, all default formatters will be
    #  applied.
    #  If provided, only the specified formatters will be applied.
    #  Note: Some essential formatters like angle bracket removal will always be
    #  applied.
    #  @default undefined
    attr_reader :formatters_enabled
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param enabled [Boolean] This determines whether the chunk is formatted before being sent to the voice
    #  provider. This helps with enunciation. This includes phone numbers, emails and
    #  addresses. Default `true`.
    #  Usage:
    #  - To rely on the voice provider's formatting logic, set this to `false`.
    #  If `voice.chunkPlan.enabled` is `false`, this is automatically `false` since
    #  there's no chunk to format.
    #  @default true
    # @param number_to_digits_cutoff [Float] This is the cutoff after which a number is converted to individual digits
    #  instead of being spoken as words.
    #  Example:
    #  - If cutoff 2025, "12345" is converted to "1 2 3 4 5" while "1200" is converted
    #  to "twelve hundred".
    #  Usage:
    #  - If your use case doesn't involve IDs like zip codes, set this to a high value.
    #  - If your use case involves IDs that are shorter than 5 digits, set this to a
    #  lower value.
    #  @default 2025
    # @param replacements [Array<Vapi::FormatPlanReplacementsItem>] These are the custom replacements you can make to the chunk before it is sent to
    #  the voice provider.
    #  Usage:
    #  - To replace a specific word or phrase with a different word or phrase, use the
    #  `ExactReplacement` type. Eg. `{ type: 'exact', key: 'hello', value: 'hi' }`
    #  - To replace a word or phrase that matches a pattern, use the `RegexReplacement`
    #  type. Eg. `{ type: 'regex', regex: '\\b[a-zA-Z]{5}\\b', value: 'hi' }`
    #  @default []
    # @param formatters_enabled [Array<Vapi::FormatPlanFormattersEnabledItem>] List of formatters to apply. If not provided, all default formatters will be
    #  applied.
    #  If provided, only the specified formatters will be applied.
    #  Note: Some essential formatters like angle bracket removal will always be
    #  applied.
    #  @default undefined
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FormatPlan]
    def initialize(enabled: OMIT, number_to_digits_cutoff: OMIT, replacements: OMIT, formatters_enabled: OMIT,
                   additional_properties: nil)
      @enabled = enabled if enabled != OMIT
      @number_to_digits_cutoff = number_to_digits_cutoff if number_to_digits_cutoff != OMIT
      @replacements = replacements if replacements != OMIT
      @formatters_enabled = formatters_enabled if formatters_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "enabled": enabled,
        "numberToDigitsCutoff": number_to_digits_cutoff,
        "replacements": replacements,
        "formattersEnabled": formatters_enabled
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FormatPlan
    #
    # @param json_object [String]
    # @return [Vapi::FormatPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      enabled = parsed_json["enabled"]
      number_to_digits_cutoff = parsed_json["numberToDigitsCutoff"]
      replacements = parsed_json["replacements"]&.map do |item|
        item = item.to_json
        Vapi::FormatPlanReplacementsItem.from_json(json_object: item)
      end
      formatters_enabled = parsed_json["formattersEnabled"]
      new(
        enabled: enabled,
        number_to_digits_cutoff: number_to_digits_cutoff,
        replacements: replacements,
        formatters_enabled: formatters_enabled,
        additional_properties: struct
      )
    end

    # Serialize an instance of FormatPlan to a JSON object
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
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.number_to_digits_cutoff&.is_a?(Float) != false || raise("Passed value for field obj.number_to_digits_cutoff is not the expected type, validation failed.")
      obj.replacements&.is_a?(Array) != false || raise("Passed value for field obj.replacements is not the expected type, validation failed.")
      obj.formatters_enabled&.is_a?(Array) != false || raise("Passed value for field obj.formatters_enabled is not the expected type, validation failed.")
    end
  end
end
