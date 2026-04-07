# frozen_string_literal: true

module Vapi
  module Types
    class TextInsightFromCallTable < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :type, -> { Vapi::Types::TextInsightFromCallTableType }, optional: false, nullable: false
      field :formula, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :time_range, -> { Vapi::Types::InsightTimeRange }, optional: true, nullable: false, api_name: "timeRange"
      field :queries, -> { Internal::Types::Array[Vapi::Types::TextInsightFromCallTableQueriesItem] }, optional: false, nullable: false
    end
  end
end
