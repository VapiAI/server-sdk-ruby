# frozen_string_literal: true

module Vapi
  module Types
    class CreateSimulationDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :scenario_id, -> { String }, optional: false, nullable: false, api_name: "scenarioId"
      field :personality_id, -> { String }, optional: false, nullable: false, api_name: "personalityId"
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
