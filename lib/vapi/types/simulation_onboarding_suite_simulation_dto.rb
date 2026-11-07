# frozen_string_literal: true

module Vapi
  module Types
    class SimulationOnboardingSuiteSimulationDto < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :scenario_id, -> { String }, optional: false, nullable: false, api_name: "scenarioId"
      field :name, -> { String }, optional: false, nullable: false
      field :personality_name, -> { String }, optional: true, nullable: false, api_name: "personalityName"
      field :success_criteria, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "successCriteria"
      field :requirement_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "requirementIds"
      field :mocked_tools, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "mockedTools"
    end
  end
end
