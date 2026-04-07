# frozen_string_literal: true

module Vapi
  module Types
    class MakeToolProviderDetails < Internal::Types::Model
      field :template_url, -> { String }, optional: true, nullable: false, api_name: "templateUrl"
      field :setup_instructions, -> { Internal::Types::Array[Vapi::Types::ToolTemplateSetup] }, optional: true, nullable: false, api_name: "setupInstructions"
      field :scenario_id, -> { Integer }, optional: true, nullable: false, api_name: "scenarioId"
      field :scenario_name, -> { String }, optional: true, nullable: false, api_name: "scenarioName"
      field :trigger_hook_id, -> { Integer }, optional: true, nullable: false, api_name: "triggerHookId"
      field :trigger_hook_name, -> { String }, optional: true, nullable: false, api_name: "triggerHookName"
    end
  end
end
