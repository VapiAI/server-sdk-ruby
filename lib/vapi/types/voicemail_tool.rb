# frozen_string_literal: true

module Vapi
  module Types
    class VoicemailTool < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::VoicemailToolMessagesItem] }, optional: true, nullable: false
      field :beep_detection_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "beepDetectionEnabled"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
