# frozen_string_literal: true

module Vapi
  module Types
    class EventsTableStringCondition < Internal::Types::Model
      field :column, -> { String }, optional: false, nullable: false
      field :operator, -> { Vapi::Types::EventsTableStringConditionOperator }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
