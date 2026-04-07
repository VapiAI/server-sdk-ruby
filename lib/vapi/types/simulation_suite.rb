# frozen_string_literal: true

module Vapi
  module Types
    class SimulationSuite < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: false, nullable: false
      field :slack_webhook_url, -> { String }, optional: true, nullable: false, api_name: "slackWebhookUrl"
      field :path, -> { String }, optional: true, nullable: false
      field :simulation_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "simulationIds"
    end
  end
end
