# frozen_string_literal: true

module Vapi
  module Types
    class Simulation < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
      field :scenario_id, -> { String }, optional: false, nullable: false, api_name: "scenarioId"
      field :personality_id, -> { String }, optional: false, nullable: false, api_name: "personalityId"
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
