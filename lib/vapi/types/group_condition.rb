# frozen_string_literal: true

module Vapi
  module Types
    # Combines nested regular-expression, Liquid, or grouped conditions with an `AND` or `OR` operator.
    class GroupCondition < Internal::Types::Model
      field :operator, -> { Vapi::Types::GroupConditionOperator }, optional: false, nullable: false
      field :conditions, -> { Internal::Types::Array[Vapi::Types::GroupConditionConditionsItem] }, optional: false, nullable: false
    end
  end
end
