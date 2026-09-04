# frozen_string_literal: true

module Vapi
  module Types
    class CampaignContact < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :customer_id, -> { String }, optional: true, nullable: false, api_name: "customerId"
      field :number, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :squad_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "squadOverrides"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
