# frozen_string_literal: true

module Vapi
  module Types
    # Fields used to update a pie-chart insight, including its queries, formulas, grouping, time range, and name.
    class UpdatePieInsightFromCallTableDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :formulas, -> { Internal::Types::Array[Vapi::Types::InsightFormula] }, optional: true, nullable: false
      field :time_range, -> { Vapi::Types::InsightTimeRange }, optional: true, nullable: false, api_name: "timeRange"
      field :group_by, -> { Vapi::Types::UpdatePieInsightFromCallTableDtoGroupBy }, optional: true, nullable: false, api_name: "groupBy"
      field :queries, -> { Internal::Types::Array[Vapi::Types::UpdatePieInsightFromCallTableDtoQueriesItem] }, optional: true, nullable: false
    end
  end
end
