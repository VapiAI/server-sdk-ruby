# frozen_string_literal: true

module Vapi
  module Types
    # Defines an additional Liquid-based variable from values extracted during a call.
    class VariableExtractionAlias < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
