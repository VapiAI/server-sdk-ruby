# frozen_string_literal: true

module Vapi
  module Types
    class BooleanComparatorScorecardMetricCondition < Internal::Types::Model
      field :type, -> { Vapi::Types::BooleanComparatorScorecardMetricConditionType }, optional: false, nullable: false
      field :comparator, -> { Vapi::Types::BooleanComparatorScorecardMetricConditionComparator }, optional: false, nullable: false
      field :value, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :points, -> { Integer }, optional: false, nullable: false
    end
  end
end
