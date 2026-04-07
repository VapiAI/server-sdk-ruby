# frozen_string_literal: true

module Vapi
  module Types
    class FilterStringTypeColumnOnCallTable < Internal::Types::Model
      field :column, -> { Vapi::Types::FilterStringTypeColumnOnCallTableColumn }, optional: false, nullable: false
      field :operator, -> { Vapi::Types::FilterStringTypeColumnOnCallTableOperator }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
