# frozen_string_literal: true

module Vapi
  module Types
    # Filters a structured-output value stored on a call using comparison, membership, containment, or emptiness
    # operators.
    class FilterStructuredOutputColumnOnCallTable < Internal::Types::Model
      field :column, -> { Vapi::Types::FilterStructuredOutputColumnOnCallTableColumn }, optional: false, nullable: false
      field :operator, -> { Vapi::Types::FilterStructuredOutputColumnOnCallTableOperator }, optional: false, nullable: false
      field :value, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
