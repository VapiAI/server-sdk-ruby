# frozen_string_literal: true

module Vapi
  module Types
    module TimeRangeStep
      extend Vapi::Internal::Types::Enum

      SECOND = "second"
      MINUTE = "minute"
      HOUR = "hour"
      DAY = "day"
      WEEK = "week"
      MONTH = "month"
      QUARTER = "quarter"
      YEAR = "year"
      DECADE = "decade"
      CENTURY = "century"
      MILLENNIUM = "millennium"
    end
  end
end
