# frozen_string_literal: true

module Vapi
  module Types
    class ScorecardMetricConditionsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::NumberComparatorScorecardMetricCondition }
      member -> { Vapi::Types::BooleanComparatorScorecardMetricCondition }
    end
  end
end
