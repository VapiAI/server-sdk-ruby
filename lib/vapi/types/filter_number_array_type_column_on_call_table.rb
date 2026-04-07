# frozen_string_literal: true

module Vapi
  module Types
    class FilterNumberArrayTypeColumnOnCallTable < Internal::Types::Model
      field :column, -> { Vapi::Types::FilterNumberArrayTypeColumnOnCallTableColumn }, optional: false, nullable: false
      field :operator, -> { Vapi::Types::FilterNumberArrayTypeColumnOnCallTableOperator }, optional: false, nullable: false
      field :value, -> { Internal::Types::Array[Integer] }, optional: false, nullable: false
    end
  end
end
