# frozen_string_literal: true

module Vapi
  module Types
    class PieInsightFromCallTable < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :type, -> { Vapi::Types::PieInsightFromCallTableType }, optional: false, nullable: false
      field :formulas, -> { Internal::Types::Array[Vapi::Types::InsightFormula] }, optional: true, nullable: false
      field :time_range, -> { Vapi::Types::InsightTimeRange }, optional: true, nullable: false, api_name: "timeRange"
      field :group_by, -> { Vapi::Types::PieInsightFromCallTableGroupBy }, optional: true, nullable: false, api_name: "groupBy"
      field :queries, -> { Internal::Types::Array[Vapi::Types::PieInsightFromCallTableQueriesItem] }, optional: false, nullable: false
    end
  end
end
