# frozen_string_literal: true

module Vapi
  module Types
    class FourierDenoisingPlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :media_detection_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "mediaDetectionEnabled"
      field :static_threshold, -> { Integer }, optional: true, nullable: false, api_name: "staticThreshold"
      field :baseline_offset_db, -> { Integer }, optional: true, nullable: false, api_name: "baselineOffsetDb"
      field :window_size_ms, -> { Integer }, optional: true, nullable: false, api_name: "windowSizeMs"
      field :baseline_percentile, -> { Integer }, optional: true, nullable: false, api_name: "baselinePercentile"
    end
  end
end
