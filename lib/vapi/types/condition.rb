# frozen_string_literal: true

module Vapi
  module Types
    class Condition < Internal::Types::Model
      field :operator, -> { Vapi::Types::ConditionOperator }, optional: false, nullable: false
      field :param, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
