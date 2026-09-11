# frozen_string_literal: true

module Vapi
  module Types
    # Start, end, timezone, and time step used for analytics aggregation.
    class TimeRange < Internal::Types::Model
      field :step, -> { Vapi::Types::TimeRangeStep }, optional: true, nullable: false
      field :start, -> { String }, optional: true, nullable: false
      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"
      field :timezone, -> { String }, optional: true, nullable: false
    end
  end
end
