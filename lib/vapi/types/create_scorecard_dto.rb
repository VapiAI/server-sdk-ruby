# frozen_string_literal: true

module Vapi
  module Types
    class CreateScorecardDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :metrics, -> { Internal::Types::Array[Vapi::Types::ScorecardMetric] }, optional: false, nullable: false
      field :assistant_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "assistantIds"
    end
  end
end
