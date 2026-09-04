# frozen_string_literal: true

module Vapi
  module Types
    # Filters event data by comparing a boolean field with an expected value.
    class EventsTableBooleanCondition < Internal::Types::Model
      field :column, -> { String }, optional: false, nullable: false
      field :operator, -> { Vapi::Types::EventsTableBooleanConditionOperator }, optional: false, nullable: false
      field :value, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
