# frozen_string_literal: true

module Vapi
  module Types
    # VapiQL JSON query that counts values from a string-valued call-table column with optional call filters.
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
