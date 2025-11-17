# frozen_string_literal: true

require_relative "security_filter_base"
require_relative "security_filter_plan_mode"
require "ostruct"
require "json"

module Vapi
  class SecurityFilterPlan
    # @return [Boolean] Whether the security filter is enabled.
    #  @default false
    attr_reader :enabled
    # @return [Array<Vapi::SecurityFilterBase>] Array of security filter types to apply.
    #  If array is not empty, only those security filters are run.
    attr_reader :filters
    # @return [Vapi::SecurityFilterPlanMode] Mode of operation when a security threat is detected.
    #  - 'sanitize': Remove or replace the threatening content
    #  - 'reject': Replace the entire transcript with replacement text
    #  - 'replace': Replace threatening patterns with replacement text
    #  @default 'sanitize'
    attr_reader :mode
    # @return [String] Text to use when replacing filtered content.
    #  @default '[FILTERED]'
    attr_reader :replacement_text
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param enabled [Boolean] Whether the security filter is enabled.
    #  @default false
    # @param filters [Array<Vapi::SecurityFilterBase>] Array of security filter types to apply.
    #  If array is not empty, only those security filters are run.
    # @param mode [Vapi::SecurityFilterPlanMode] Mode of operation when a security threat is detected.
    #  - 'sanitize': Remove or replace the threatening content
    #  - 'reject': Replace the entire transcript with replacement text
    #  - 'replace': Replace threatening patterns with replacement text
    #  @default 'sanitize'
    # @param replacement_text [String] Text to use when replacing filtered content.
    #  @default '[FILTERED]'
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SecurityFilterPlan]
    def initialize(enabled: OMIT, filters: OMIT, mode: OMIT, replacement_text: OMIT, additional_properties: nil)
      @enabled = enabled if enabled != OMIT
      @filters = filters if filters != OMIT
      @mode = mode if mode != OMIT
      @replacement_text = replacement_text if replacement_text != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "enabled": enabled,
        "filters": filters,
        "mode": mode,
        "replacementText": replacement_text
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SecurityFilterPlan
    #
    # @param json_object [String]
    # @return [Vapi::SecurityFilterPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      enabled = parsed_json["enabled"]
      filters = parsed_json["filters"]&.map do |item|
        item = item.to_json
        Vapi::SecurityFilterBase.from_json(json_object: item)
      end
      mode = parsed_json["mode"]
      replacement_text = parsed_json["replacementText"]
      new(
        enabled: enabled,
        filters: filters,
        mode: mode,
        replacement_text: replacement_text,
        additional_properties: struct
      )
    end

    # Serialize an instance of SecurityFilterPlan to a JSON object
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
      obj.filters&.is_a?(Array) != false || raise("Passed value for field obj.filters is not the expected type, validation failed.")
      obj.mode&.is_a?(Vapi::SecurityFilterPlanMode) != false || raise("Passed value for field obj.mode is not the expected type, validation failed.")
      obj.replacement_text&.is_a?(String) != false || raise("Passed value for field obj.replacement_text is not the expected type, validation failed.")
    end
  end
end
