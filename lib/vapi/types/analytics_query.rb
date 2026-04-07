# frozen_string_literal: true

module Vapi
  module Types
    class AnalyticsQuery < Internal::Types::Model
      field :table, -> { Vapi::Types::AnalyticsQueryTable }, optional: false, nullable: false
      field :group_by, -> { Internal::Types::Array[Vapi::Types::AnalyticsQueryGroupByItem] }, optional: true, nullable: false, api_name: "groupBy"
      field :group_by_variable_value, -> { Internal::Types::Array[Vapi::Types::VariableValueGroupBy] }, optional: true, nullable: false, api_name: "groupByVariableValue"
      field :name, -> { String }, optional: false, nullable: false
      field :time_range, -> { Vapi::Types::TimeRange }, optional: true, nullable: false, api_name: "timeRange"
      field :operations, -> { Internal::Types::Array[Vapi::Types::AnalyticsOperation] }, optional: false, nullable: false
    end
  end
end
