# frozen_string_literal: true

module Vapi
  module Types
    # A scorecard metric that awards points when a structured output meets its configured conditions.
    class ScorecardMetric < Internal::Types::Model
      field :conditions, -> { Internal::Types::Array[Vapi::Types::ScorecardMetricConditionsItem] }, optional: false, nullable: false
      field :structured_output_id, -> { String }, optional: false, nullable: false, api_name: "structuredOutputId"
    end
  end
end
