# frozen_string_literal: true

module Vapi
  module Types
    class GhlToolProviderDetails < Internal::Types::Model
      field :template_url, -> { String }, optional: true, nullable: false, api_name: "templateUrl"
      field :setup_instructions, -> { Internal::Types::Array[Vapi::Types::ToolTemplateSetup] }, optional: true, nullable: false, api_name: "setupInstructions"
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :workflow_name, -> { String }, optional: true, nullable: false, api_name: "workflowName"
      field :webhook_hook_id, -> { String }, optional: true, nullable: false, api_name: "webhookHookId"
      field :webhook_hook_name, -> { String }, optional: true, nullable: false, api_name: "webhookHookName"
      field :location_id, -> { String }, optional: true, nullable: false, api_name: "locationId"
    end
  end
end
