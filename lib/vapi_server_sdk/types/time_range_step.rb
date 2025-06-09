# frozen_string_literal: true

module Vapi
# This is the time step for aggregations.
#  If not provided, defaults to returning for the entire time range.
  class TimeRangeStep

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