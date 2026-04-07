# frozen_string_literal: true

module Vapi
  module Types
    class InsightFormula < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :formula, -> { String }, optional: false, nullable: false
    end
  end
end
