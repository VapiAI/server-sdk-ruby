# frozen_string_literal: true

module Vapi
  module Types
    # Start, end, timezone, and aggregation step used for a time-series insight query.
    class InsightTimeRangeWithStep < Internal::Types::Model
      field :step, -> { Vapi::Types::InsightTimeRangeWithStepStep }, optional: true, nullable: false
      field :start, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :end_, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "end"
      field :timezone, -> { String }, optional: true, nullable: false
    end
  end
end
