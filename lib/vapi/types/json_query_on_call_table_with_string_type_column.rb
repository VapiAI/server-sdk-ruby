# frozen_string_literal: true

module Vapi
  module Types
    class JsonQueryOnCallTableWithStringTypeColumn < Internal::Types::Model
      field :type, -> { Vapi::Types::JsonQueryOnCallTableWithStringTypeColumnType }, optional: false, nullable: false
      field :table, -> { Vapi::Types::JsonQueryOnCallTableWithStringTypeColumnTable }, optional: false, nullable: false
      field :filters, -> { Internal::Types::Array[Vapi::Types::JsonQueryOnCallTableWithStringTypeColumnFiltersItem] }, optional: true, nullable: false
      field :column, -> { Vapi::Types::JsonQueryOnCallTableWithStringTypeColumnColumn }, optional: false, nullable: false
      field :operation, -> { Vapi::Types::JsonQueryOnCallTableWithStringTypeColumnOperation }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
