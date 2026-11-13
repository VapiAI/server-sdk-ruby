# frozen_string_literal: true

module Vapi
  module Types
    # The result of a named analytics query, including the evaluated time range and returned metric data.
    class AnalyticsQueryResult < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :time_range, -> { Vapi::Types::TimeRange }, optional: false, nullable: false, api_name: "timeRange"
      field :result, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false
    end
  end
end
