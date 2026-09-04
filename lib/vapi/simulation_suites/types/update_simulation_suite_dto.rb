# frozen_string_literal: true

module Vapi
  module SimulationSuites
    module Types
      class UpdateSimulationSuiteDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :slack_webhook_url, -> { String }, optional: true, nullable: false, api_name: "slackWebhookUrl"
        field :simulation_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "simulationIds"
        field :target_assignments, -> { Internal::Types::Array[Vapi::Types::SimulationSuiteTargetAssignment] }, optional: true, nullable: false, api_name: "targetAssignments"
        field :path, -> { String }, optional: true, nullable: false
      end
    end
  end
end
