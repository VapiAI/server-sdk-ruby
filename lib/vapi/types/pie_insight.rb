# frozen_string_literal: true

module Vapi
  module Types
    # A saved pie-chart insight containing its call-data queries, formulas, grouping, time range, and lifecycle
    # information.
    class PieInsight < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :formulas, -> { Internal::Types::Array[Vapi::Types::InsightFormula] }, optional: true, nullable: false
      field :time_range, -> { Vapi::Types::InsightTimeRange }, optional: true, nullable: false, api_name: "timeRange"
      field :group_by, -> { Vapi::Types::PieInsightGroupBy }, optional: true, nullable: false, api_name: "groupBy"
      field :queries, -> { Internal::Types::Array[Vapi::Types::PieInsightQueriesItem] }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :system_key, -> { String }, optional: true, nullable: false, api_name: "systemKey"
    end
  end
end
