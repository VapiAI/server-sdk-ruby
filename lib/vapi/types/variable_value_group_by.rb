# frozen_string_literal: true

module Vapi
  module Types
    # Groups analytics results by a selected assistant variable-value key.
    class VariableValueGroupBy < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false
    end
  end
end
