# frozen_string_literal: true

module Vapi
  module Campaigns
    module Types
      class UpdateCampaignDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
        field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
        field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
        field :phone_number_id, -> { String }, optional: true, nullable: false, api_name: "phoneNumberId"
        field :dial_plan, -> { Internal::Types::Array[Vapi::Types::DialPlanEntry] }, optional: true, nullable: false, api_name: "dialPlan"
        field :schedule_plan, -> { Vapi::Types::SchedulePlan }, optional: true, nullable: false, api_name: "schedulePlan"
        field :status, -> { Vapi::Campaigns::Types::UpdateCampaignDtoStatus }, optional: true, nullable: false
      end
    end
  end
end
