# frozen_string_literal: true

module Vapi
  module Types
    # Defines structured variables to extract and optional aliases made available during and after a call.
    class VariableExtractionPlan < Internal::Types::Model
      field :schema, -> { Vapi::Types::JsonSchema }, optional: true, nullable: false
      field :aliases, -> { Internal::Types::Array[Vapi::Types::VariableExtractionAlias] }, optional: true, nullable: false
    end
  end
end
