# frozen_string_literal: true

module Vapi
  module Types
    # Filters event data by comparing a numeric field with a value.
    class EventsTableNumberCondition < Internal::Types::Model
      field :column, -> { String }, optional: false, nullable: false
      field :operator, -> { Vapi::Types::EventsTableNumberConditionOperator }, optional: false, nullable: false
      field :value, -> { Integer }, optional: false, nullable: false
    end
  end
end
