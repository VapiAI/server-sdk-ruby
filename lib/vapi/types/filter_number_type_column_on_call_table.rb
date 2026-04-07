# frozen_string_literal: true

module Vapi
  module Types
    class FilterNumberTypeColumnOnCallTable < Internal::Types::Model
      field :column, -> { Vapi::Types::FilterNumberTypeColumnOnCallTableColumn }, optional: false, nullable: false
      field :operator, -> { Vapi::Types::FilterNumberTypeColumnOnCallTableOperator }, optional: false, nullable: false
      field :value, -> { Integer }, optional: false, nullable: false
    end
  end
end
