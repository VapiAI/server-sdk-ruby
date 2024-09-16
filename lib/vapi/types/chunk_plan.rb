# frozen_string_literal: true

require_relative "chunk_plan_punctuation_boundaries_item"
require_relative "format_plan"
require "ostruct"
require "json"

module Vapi
  class ChunkPlan
    # @return [Boolean] This determines whether the model output is chunked before being sent to the
    #  voice provider. Default `true`.
    #  Usage:
    #  - To rely on the voice provider's audio generation logic, set this to `false`.
    #  - If seeing issues with quality, set this to `true`.
    #  If disabled, Vapi-provided audio control tokens like <flush /> will not work.
    #  @default true
    attr_reader :enabled
    # @return [Float] This is the minimum number of characters in a chunk.
    #  Usage:
    #  - To increase quality, set this to a higher value.
    #  - To decrease latency, set this to a lower value.
    #  @default 30
    attr_reader :min_characters
    # @return [Array<Vapi::ChunkPlanPunctuationBoundariesItem>] These are the punctuations that are considered valid boundaries for a chunk to
    #  be created.
    #  Usage:
    #  - To increase quality, constrain to fewer boundaries.
    #  - To decrease latency, enable all.
    #  Default is automatically set to balance the trade-off between quality and
    #  latency based on the provider.
    attr_reader :punctuation_boundaries
    # @return [Vapi::FormatPlan] This is the plan for formatting the chunk before it is sent to the voice
    #  provider.
    attr_reader :format_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param enabled [Boolean] This determines whether the model output is chunked before being sent to the
    #  voice provider. Default `true`.
    #  Usage:
    #  - To rely on the voice provider's audio generation logic, set this to `false`.
    #  - If seeing issues with quality, set this to `true`.
    #  If disabled, Vapi-provided audio control tokens like <flush /> will not work.
    #  @default true
    # @param min_characters [Float] This is the minimum number of characters in a chunk.
    #  Usage:
    #  - To increase quality, set this to a higher value.
    #  - To decrease latency, set this to a lower value.
    #  @default 30
    # @param punctuation_boundaries [Array<Vapi::ChunkPlanPunctuationBoundariesItem>] These are the punctuations that are considered valid boundaries for a chunk to
    #  be created.
    #  Usage:
    #  - To increase quality, constrain to fewer boundaries.
    #  - To decrease latency, enable all.
    #  Default is automatically set to balance the trade-off between quality and
    #  latency based on the provider.
    # @param format_plan [Vapi::FormatPlan] This is the plan for formatting the chunk before it is sent to the voice
    #  provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChunkPlan]
    def initialize(enabled: OMIT, min_characters: OMIT, punctuation_boundaries: OMIT, format_plan: OMIT,
                   additional_properties: nil)
      @enabled = enabled if enabled != OMIT
      @min_characters = min_characters if min_characters != OMIT
      @punctuation_boundaries = punctuation_boundaries if punctuation_boundaries != OMIT
      @format_plan = format_plan if format_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "enabled": enabled,
        "minCharacters": min_characters,
        "punctuationBoundaries": punctuation_boundaries,
        "formatPlan": format_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ChunkPlan
    #
    # @param json_object [String]
    # @return [Vapi::ChunkPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      enabled = parsed_json["enabled"]
      min_characters = parsed_json["minCharacters"]
      punctuation_boundaries = parsed_json["punctuationBoundaries"]
      if parsed_json["formatPlan"].nil?
        format_plan = nil
      else
        format_plan = parsed_json["formatPlan"].to_json
        format_plan = Vapi::FormatPlan.from_json(json_object: format_plan)
      end
      new(
        enabled: enabled,
        min_characters: min_characters,
        punctuation_boundaries: punctuation_boundaries,
        format_plan: format_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of ChunkPlan to a JSON object
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
      obj.min_characters&.is_a?(Float) != false || raise("Passed value for field obj.min_characters is not the expected type, validation failed.")
      obj.punctuation_boundaries&.is_a?(Array) != false || raise("Passed value for field obj.punctuation_boundaries is not the expected type, validation failed.")
      obj.format_plan.nil? || Vapi::FormatPlan.validate_raw(obj: obj.format_plan)
    end
  end
end
