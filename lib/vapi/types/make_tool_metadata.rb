# frozen_string_literal: true

module Vapi
  module Types
    class MakeToolMetadata < Internal::Types::Model
      field :scenario_id, -> { Integer }, optional: true, nullable: false, api_name: "scenarioId"
      field :trigger_hook_id, -> { Integer }, optional: true, nullable: false, api_name: "triggerHookId"
    end
  end
end
