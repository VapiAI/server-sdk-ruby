# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class CartesiaGenerationConfigExperimental
    # @return [Integer] Toggle accent localization for sonic-3: 0 (disabled, default) or 1 (enabled).
    #  When enabled, the voice adapts to match the transcript language accent while
    #  preserving vocal characteristics.
    attr_reader :accent_localization
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param accent_localization [Integer] Toggle accent localization for sonic-3: 0 (disabled, default) or 1 (enabled).
    #  When enabled, the voice adapts to match the transcript language accent while
    #  preserving vocal characteristics.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CartesiaGenerationConfigExperimental]
    def initialize(accent_localization: OMIT, additional_properties: nil)
      @accent_localization = accent_localization if accent_localization != OMIT
      @additional_properties = additional_properties
      @_field_set = { "accentLocalization": accent_localization }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CartesiaGenerationConfigExperimental
    #
    # @param json_object [String]
    # @return [Vapi::CartesiaGenerationConfigExperimental]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      accent_localization = parsed_json["accentLocalization"]
      new(accent_localization: accent_localization, additional_properties: struct)
    end

    # Serialize an instance of CartesiaGenerationConfigExperimental to a JSON object
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
      obj.accent_localization&.is_a?(Integer) != false || raise("Passed value for field obj.accent_localization is not the expected type, validation failed.")
    end
  end
end
