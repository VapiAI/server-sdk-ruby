# frozen_string_literal: true

module Vapi
  module Types
    class LineInsightFromCallTable < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :type, -> { Vapi::Types::LineInsightFromCallTableType }, optional: false, nullable: false
      field :formulas, -> { Internal::Types::Array[Vapi::Types::InsightFormula] }, optional: true, nullable: false
      field :metadata, -> { Vapi::Types::LineInsightMetadata }, optional: true, nullable: false
      field :time_range, -> { Vapi::Types::InsightTimeRangeWithStep }, optional: true, nullable: false, api_name: "timeRange"
      field :group_by, -> { Vapi::Types::LineInsightFromCallTableGroupBy }, optional: true, nullable: false, api_name: "groupBy"
      field :queries, -> { Internal::Types::Array[Vapi::Types::LineInsightFromCallTableQueriesItem] }, optional: false, nullable: false
    end
  end
end
