# frozen_string_literal: true

module Vapi
  module Types
    class StartSpeakingPlan < Internal::Types::Model
      field :wait_seconds, -> { Integer }, optional: true, nullable: false, api_name: "waitSeconds"
      field :smart_endpointing_enabled, -> { Vapi::Types::StartSpeakingPlanSmartEndpointingEnabled }, optional: true, nullable: false, api_name: "smartEndpointingEnabled"
      field :smart_endpointing_plan, -> { Vapi::Types::StartSpeakingPlanSmartEndpointingPlan }, optional: true, nullable: false, api_name: "smartEndpointingPlan"
      field :custom_endpointing_rules, -> { Internal::Types::Array[Vapi::Types::StartSpeakingPlanCustomEndpointingRulesItem] }, optional: true, nullable: false, api_name: "customEndpointingRules"
      field :transcription_endpointing_plan, -> { Vapi::Types::TranscriptionEndpointingPlan }, optional: true, nullable: false, api_name: "transcriptionEndpointingPlan"
    end
  end
end
