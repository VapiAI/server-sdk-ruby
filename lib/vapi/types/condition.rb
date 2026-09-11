# frozen_string_literal: true

module Vapi
  module Types
    # Compares a named parameter with a value using the selected comparison operator.
    class Condition < Internal::Types::Model
      field :operator, -> { Vapi::Types::ConditionOperator }, optional: false, nullable: false
      field :param, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
