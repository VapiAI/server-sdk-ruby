# frozen_string_literal: true

module Vapi
  module ObservabilityScorecard
    module Types
      class UpdateScorecardDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :description, -> { String }, optional: true, nullable: false
        field :metrics, -> { Internal::Types::Array[Vapi::Types::ScorecardMetric] }, optional: true, nullable: false
        field :assistant_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "assistantIds"
      end
    end
  end
end
