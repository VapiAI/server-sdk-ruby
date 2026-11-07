# frozen_string_literal: true

module Vapi
  module Types
    module LatencyEvaluationResultAggregation
      extend Vapi::Internal::Types::Enum

      MEAN = "mean"
      MEDIAN = "median"
      P_95 = "p95"
      MAX = "max"
    end
  end
end
