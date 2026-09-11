# frozen_string_literal: true

module Vapi
  module Types
    # A formula used to calculate an insight from its query results, with an optional display name.
    class InsightFormula < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :formula, -> { String }, optional: false, nullable: false
    end
  end
end
