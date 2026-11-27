# frozen_string_literal: true

module Vapi
  module Types
    # Display settings for a bar insight, including chart name, axis labels, and optional y-axis bounds.
    class BarInsightMetadata < Internal::Types::Model
      field :x_axis_label, -> { String }, optional: true, nullable: false, api_name: "xAxisLabel"
      field :y_axis_label, -> { String }, optional: true, nullable: false, api_name: "yAxisLabel"
      field :y_axis_min, -> { Integer }, optional: true, nullable: false, api_name: "yAxisMin"
      field :y_axis_max, -> { Integer }, optional: true, nullable: false, api_name: "yAxisMax"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
