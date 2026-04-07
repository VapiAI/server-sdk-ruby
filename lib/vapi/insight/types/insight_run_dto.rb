# frozen_string_literal: true

module Vapi
  module Insight
    module Types
      class InsightRunDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :format_plan, -> { Vapi::Types::InsightRunFormatPlan }, optional: true, nullable: false, api_name: "formatPlan"
        field :time_range_override, -> { Vapi::Types::InsightTimeRangeWithStep }, optional: true, nullable: false, api_name: "timeRangeOverride"
      end
    end
  end
end
