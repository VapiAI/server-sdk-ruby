# frozen_string_literal: true

module Vapi
  module Types
    class GoHighLevelCalendarAvailabilityToolProviderDetails < Internal::Types::Model
      field :template_url, -> { String }, optional: true, nullable: false, api_name: "templateUrl"
      field :setup_instructions, -> { Internal::Types::Array[Vapi::Types::ToolTemplateSetup] }, optional: true, nullable: false, api_name: "setupInstructions"
    end
  end
end
