# frozen_string_literal: true

module Vapi
  module Types
    # Configuration used to create a text-value insight from call data using metric queries, a formula, and a time
    # range.
    class CreateTextInsightFromCallTableDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :formula, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :time_range, -> { Vapi::Types::InsightTimeRange }, optional: true, nullable: false, api_name: "timeRange"
      field :queries, -> { Internal::Types::Array[Vapi::Types::CreateTextInsightFromCallTableDtoQueriesItem] }, optional: false, nullable: false
    end
  end
end
