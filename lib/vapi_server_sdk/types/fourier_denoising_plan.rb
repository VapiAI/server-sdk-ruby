# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class FourierDenoisingPlan
    # @return [Boolean] Whether Fourier denoising is enabled. Note that this is experimental and may not
    #  work as expected.
    attr_reader :enabled
    # @return [Boolean] Whether automatic media detection is enabled. When enabled, the filter will
    #  automatically
    #  detect consistent background TV/music/radio and switch to more aggressive
    #  filtering settings.
    #  Only applies when enabled is true.
    attr_reader :media_detection_enabled
    # @return [Float] Static threshold in dB used as fallback when no baseline is established.
    attr_reader :static_threshold
    # @return [Float] How far below the rolling baseline to filter audio, in dB.
    #  Lower values (e.g., -10) are more aggressive, higher values (e.g., -20) are more
    #  conservative.
    attr_reader :baseline_offset_db
    # @return [Float] Rolling window size in milliseconds for calculating the audio baseline.
    #  Larger windows adapt more slowly but are more stable.
    attr_reader :window_size_ms
    # @return [Float] Percentile to use for baseline calculation (1-99).
    #  Higher percentiles (e.g., 85) focus on louder speech, lower percentiles (e.g.,
    #  50) include quieter speech.
    attr_reader :baseline_percentile
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param enabled [Boolean] Whether Fourier denoising is enabled. Note that this is experimental and may not
    #  work as expected.
    # @param media_detection_enabled [Boolean] Whether automatic media detection is enabled. When enabled, the filter will
    #  automatically
    #  detect consistent background TV/music/radio and switch to more aggressive
    #  filtering settings.
    #  Only applies when enabled is true.
    # @param static_threshold [Float] Static threshold in dB used as fallback when no baseline is established.
    # @param baseline_offset_db [Float] How far below the rolling baseline to filter audio, in dB.
    #  Lower values (e.g., -10) are more aggressive, higher values (e.g., -20) are more
    #  conservative.
    # @param window_size_ms [Float] Rolling window size in milliseconds for calculating the audio baseline.
    #  Larger windows adapt more slowly but are more stable.
    # @param baseline_percentile [Float] Percentile to use for baseline calculation (1-99).
    #  Higher percentiles (e.g., 85) focus on louder speech, lower percentiles (e.g.,
    #  50) include quieter speech.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FourierDenoisingPlan]
    def initialize(enabled: OMIT, media_detection_enabled: OMIT, static_threshold: OMIT, baseline_offset_db: OMIT,
                   window_size_ms: OMIT, baseline_percentile: OMIT, additional_properties: nil)
      @enabled = enabled if enabled != OMIT
      @media_detection_enabled = media_detection_enabled if media_detection_enabled != OMIT
      @static_threshold = static_threshold if static_threshold != OMIT
      @baseline_offset_db = baseline_offset_db if baseline_offset_db != OMIT
      @window_size_ms = window_size_ms if window_size_ms != OMIT
      @baseline_percentile = baseline_percentile if baseline_percentile != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "enabled": enabled,
        "mediaDetectionEnabled": media_detection_enabled,
        "staticThreshold": static_threshold,
        "baselineOffsetDb": baseline_offset_db,
        "windowSizeMs": window_size_ms,
        "baselinePercentile": baseline_percentile
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FourierDenoisingPlan
    #
    # @param json_object [String]
    # @return [Vapi::FourierDenoisingPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      enabled = parsed_json["enabled"]
      media_detection_enabled = parsed_json["mediaDetectionEnabled"]
      static_threshold = parsed_json["staticThreshold"]
      baseline_offset_db = parsed_json["baselineOffsetDb"]
      window_size_ms = parsed_json["windowSizeMs"]
      baseline_percentile = parsed_json["baselinePercentile"]
      new(
        enabled: enabled,
        media_detection_enabled: media_detection_enabled,
        static_threshold: static_threshold,
        baseline_offset_db: baseline_offset_db,
        window_size_ms: window_size_ms,
        baseline_percentile: baseline_percentile,
        additional_properties: struct
      )
    end

    # Serialize an instance of FourierDenoisingPlan to a JSON object
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
      obj.media_detection_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.media_detection_enabled is not the expected type, validation failed.")
      obj.static_threshold&.is_a?(Float) != false || raise("Passed value for field obj.static_threshold is not the expected type, validation failed.")
      obj.baseline_offset_db&.is_a?(Float) != false || raise("Passed value for field obj.baseline_offset_db is not the expected type, validation failed.")
      obj.window_size_ms&.is_a?(Float) != false || raise("Passed value for field obj.window_size_ms is not the expected type, validation failed.")
      obj.baseline_percentile&.is_a?(Float) != false || raise("Passed value for field obj.baseline_percentile is not the expected type, validation failed.")
    end
  end
end
