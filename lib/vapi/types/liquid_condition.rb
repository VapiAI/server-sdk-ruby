# frozen_string_literal: true

module Vapi
  module Types
    # Evaluates a Liquid template that must return `true` or `false`.
    class LiquidCondition < Internal::Types::Model
      field :liquid, -> { String }, optional: false, nullable: false
    end
  end
end
