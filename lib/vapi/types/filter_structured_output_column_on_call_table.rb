# frozen_string_literal: true

module Vapi
  module Types
    class FilterStructuredOutputColumnOnCallTable < Internal::Types::Model
      field :column, -> { Vapi::Types::FilterStructuredOutputColumnOnCallTableColumn }, optional: false, nullable: false
      field :operator, -> { Vapi::Types::FilterStructuredOutputColumnOnCallTableOperator }, optional: false, nullable: false
      field :value, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
