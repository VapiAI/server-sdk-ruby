# frozen_string_literal: true

module Vapi
  module Types
    class ScorecardMetric < Internal::Types::Model
      field :structured_output_id, -> { String }, optional: false, nullable: false, api_name: "structuredOutputId"
      field :conditions, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false
    end
  end
end
