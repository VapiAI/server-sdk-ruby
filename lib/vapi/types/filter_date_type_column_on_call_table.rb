# frozen_string_literal: true

module Vapi
  module Types
    class FilterDateTypeColumnOnCallTable < Internal::Types::Model
      field :column, -> { Vapi::Types::FilterDateTypeColumnOnCallTableColumn }, optional: false, nullable: false
      field :operator, -> { Vapi::Types::FilterDateTypeColumnOnCallTableOperator }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
