# frozen_string_literal: true

module Vapi
  # This is the group by step for aggregation.
  #  If not provided, defaults to group by day.
  class InsightTimeRangeWithStepStep
    MINUTE = "minute"
    HOUR = "hour"
    DAY = "day"
    WEEK = "week"
    MONTH = "month"
    QUARTER = "quarter"
    YEAR = "year"
  end
end
