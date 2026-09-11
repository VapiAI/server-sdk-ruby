# frozen_string_literal: true

module Vapi
  module Types
    class NumberComparatorScorecardMetricCondition < Internal::Types::Model
      field :type, -> { Vapi::Types::NumberComparatorScorecardMetricConditionType }, optional: false, nullable: false
      field :comparator, -> { Vapi::Types::NumberComparatorScorecardMetricConditionComparator }, optional: false, nullable: false
      field :value, -> { Integer }, optional: false, nullable: false
      field :points, -> { Integer }, optional: false, nullable: false
    end
  end
end
