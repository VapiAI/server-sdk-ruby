# frozen_string_literal: true

module Vapi
  module Types
    # VapiQL JSON query that aggregates a numeric call-table column with optional call filters.
    class JsonQueryOnCallTableWithNumberTypeColumn < Internal::Types::Model
      field :type, -> { Vapi::Types::JsonQueryOnCallTableWithNumberTypeColumnType }, optional: false, nullable: false
      field :table, -> { Vapi::Types::JsonQueryOnCallTableWithNumberTypeColumnTable }, optional: false, nullable: false
      field :filters, -> { Internal::Types::Array[Vapi::Types::JsonQueryOnCallTableWithNumberTypeColumnFiltersItem] }, optional: true, nullable: false
      field :column, -> { Vapi::Types::JsonQueryOnCallTableWithNumberTypeColumnColumn }, optional: false, nullable: false
      field :operation, -> { Vapi::Types::JsonQueryOnCallTableWithNumberTypeColumnOperation }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
