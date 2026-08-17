# frozen_string_literal: true

module Vapi
  module Types
    # A saved bar-chart insight containing its call-data queries, formulas, grouping, stepped time range, metadata, and
    # lifecycle information.
    class BarInsight < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :formulas, -> { Internal::Types::Array[Vapi::Types::InsightFormula] }, optional: true, nullable: false
      field :metadata, -> { Vapi::Types::BarInsightMetadata }, optional: true, nullable: false
      field :time_range, -> { Vapi::Types::InsightTimeRangeWithStep }, optional: true, nullable: false, api_name: "timeRange"
      field :group_by, -> { Vapi::Types::BarInsightGroupBy }, optional: true, nullable: false, api_name: "groupBy"
      field :queries, -> { Internal::Types::Array[Vapi::Types::BarInsightQueriesItem] }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :system_key, -> { String }, optional: true, nullable: false, api_name: "systemKey"
    end
  end
end
