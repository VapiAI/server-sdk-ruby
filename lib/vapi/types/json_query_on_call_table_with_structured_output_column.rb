# frozen_string_literal: true

module Vapi
  module Types
    class JsonQueryOnCallTableWithStructuredOutputColumn < Internal::Types::Model
      field :type, -> { Vapi::Types::JsonQueryOnCallTableWithStructuredOutputColumnType }, optional: false, nullable: false
      field :table, -> { Vapi::Types::JsonQueryOnCallTableWithStructuredOutputColumnTable }, optional: false, nullable: false
      field :filters, -> { Internal::Types::Array[Vapi::Types::JsonQueryOnCallTableWithStructuredOutputColumnFiltersItem] }, optional: true, nullable: false
      field :column, -> { Vapi::Types::JsonQueryOnCallTableWithStructuredOutputColumnColumn }, optional: false, nullable: false
      field :operation, -> { Vapi::Types::JsonQueryOnCallTableWithStructuredOutputColumnOperation }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
