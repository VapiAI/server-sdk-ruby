# frozen_string_literal: true

module Vapi
  module Types
    class VariableExtractionAlias < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
