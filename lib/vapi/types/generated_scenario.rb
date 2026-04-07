# frozen_string_literal: true

module Vapi
  module Types
    class GeneratedScenario < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :instructions, -> { String }, optional: false, nullable: false
      field :category, -> { Vapi::Types::GeneratedScenarioCategory }, optional: false, nullable: false
      field :reasoning, -> { String }, optional: false, nullable: false
    end
  end
end
