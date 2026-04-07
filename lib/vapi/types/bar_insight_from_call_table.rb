# frozen_string_literal: true

module Vapi
  module Types
    class BarInsightFromCallTable < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :type, -> { Vapi::Types::BarInsightFromCallTableType }, optional: false, nullable: false
      field :formulas, -> { Internal::Types::Array[Vapi::Types::InsightFormula] }, optional: true, nullable: false
      field :metadata, -> { Vapi::Types::BarInsightMetadata }, optional: true, nullable: false
      field :time_range, -> { Vapi::Types::InsightTimeRangeWithStep }, optional: true, nullable: false, api_name: "timeRange"
      field :group_by, -> { Vapi::Types::BarInsightFromCallTableGroupBy }, optional: true, nullable: false, api_name: "groupBy"
      field :queries, -> { Internal::Types::Array[Vapi::Types::BarInsightFromCallTableQueriesItem] }, optional: false, nullable: false
    end
  end
end
