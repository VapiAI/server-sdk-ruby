# frozen_string_literal: true

module Vapi
  module Types
    # A saved text-value insight containing its call-data queries, formula, time range, and lifecycle information.
    class TextInsight < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :formula, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :time_range, -> { Vapi::Types::InsightTimeRange }, optional: true, nullable: false, api_name: "timeRange"
      field :queries, -> { Internal::Types::Array[Vapi::Types::TextInsightQueriesItem] }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :system_key, -> { String }, optional: true, nullable: false, api_name: "systemKey"
    end
  end
end
