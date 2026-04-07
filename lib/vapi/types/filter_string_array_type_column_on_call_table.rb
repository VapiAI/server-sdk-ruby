# frozen_string_literal: true

module Vapi
  module Types
    class FilterStringArrayTypeColumnOnCallTable < Internal::Types::Model
      field :column, -> { Vapi::Types::FilterStringArrayTypeColumnOnCallTableColumn }, optional: false, nullable: false
      field :operator, -> { Vapi::Types::FilterStringArrayTypeColumnOnCallTableOperator }, optional: false, nullable: false
      field :value, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
