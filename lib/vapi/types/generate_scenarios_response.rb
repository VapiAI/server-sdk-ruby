# frozen_string_literal: true

module Vapi
  module Types
    class GenerateScenariosResponse < Internal::Types::Model
      field :scenarios, -> { Internal::Types::Array[Vapi::Types::GeneratedScenario] }, optional: false, nullable: false
      field :coverage_notes, -> { String }, optional: false, nullable: false, api_name: "coverageNotes"
    end
  end
end
