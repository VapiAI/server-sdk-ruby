# frozen_string_literal: true

module Vapi
  module Types
    class JsonQueryOnEventsTable < Internal::Types::Model
      field :type, -> { Vapi::Types::JsonQueryOnEventsTableType }, optional: false, nullable: false
      field :table, -> { Vapi::Types::JsonQueryOnEventsTableTable }, optional: false, nullable: false
      field :on, -> { Vapi::Types::JsonQueryOnEventsTableOn }, optional: false, nullable: false
      field :operation, -> { Vapi::Types::JsonQueryOnEventsTableOperation }, optional: false, nullable: false
      field :filters, -> { Internal::Types::Array[Vapi::Types::JsonQueryOnEventsTableFiltersItem] }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
