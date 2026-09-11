# frozen_string_literal: true

module Vapi
  module Types
    class EndedReasonCondition < Internal::Types::Model
      field :operator, -> { Vapi::Types::EndedReasonConditionOperator }, optional: false, nullable: false
      field :values, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
