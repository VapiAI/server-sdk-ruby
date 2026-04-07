# frozen_string_literal: true

module Vapi
  module Types
    class UpdateTextInsightFromCallTableDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :formula, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :time_range, -> { Vapi::Types::InsightTimeRange }, optional: true, nullable: false, api_name: "timeRange"
      field :queries, -> { Internal::Types::Array[Vapi::Types::UpdateTextInsightFromCallTableDtoQueriesItem] }, optional: true, nullable: false
    end
  end
end
