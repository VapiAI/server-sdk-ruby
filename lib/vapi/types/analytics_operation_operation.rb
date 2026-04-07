# frozen_string_literal: true

module Vapi
  module Types
    module AnalyticsOperationOperation
      extend Vapi::Internal::Types::Enum

      SUM = "sum"
      AVG = "avg"
      COUNT = "count"
      MIN = "min"
      MAX = "max"
      HISTORY = "history"
    end
  end
end
