# frozen_string_literal: true

module Vapi
  module Types
    class AiEdgeCondition < Internal::Types::Model
      field :type, -> { Vapi::Types::AiEdgeConditionType }, optional: false, nullable: false
      field :prompt, -> { String }, optional: false, nullable: false
    end
  end
end
