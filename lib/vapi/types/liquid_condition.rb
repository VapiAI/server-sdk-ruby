# frozen_string_literal: true

module Vapi
  module Types
    class LiquidCondition < Internal::Types::Model
      field :liquid, -> { String }, optional: false, nullable: false
    end
  end
end
