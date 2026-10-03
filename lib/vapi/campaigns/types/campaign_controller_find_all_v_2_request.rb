# frozen_string_literal: true

module Vapi
  module Campaigns
    module Types
      class CampaignControllerFindAllV2Request < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false
        field :status, -> { Vapi::Campaigns::Types::CampaignControllerFindAllV2RequestStatus }, optional: true, nullable: false
        field :include_counters, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeCounters"
        field :page, -> { Integer }, optional: true, nullable: false
        field :sort_order, -> { Vapi::Campaigns::Types::CampaignControllerFindAllV2RequestSortOrder }, optional: true, nullable: false, api_name: "sortOrder"
        field :sort_by, -> { Vapi::Campaigns::Types::CampaignControllerFindAllV2RequestSortBy }, optional: true, nullable: false, api_name: "sortBy"
        field :limit, -> { Integer }, optional: true, nullable: false
        field :created_at_gt, -> { String }, optional: true, nullable: false, api_name: "createdAtGt"
        field :created_at_lt, -> { String }, optional: true, nullable: false, api_name: "createdAtLt"
        field :created_at_ge, -> { String }, optional: true, nullable: false, api_name: "createdAtGe"
        field :created_at_le, -> { String }, optional: true, nullable: false, api_name: "createdAtLe"
        field :updated_at_gt, -> { String }, optional: true, nullable: false, api_name: "updatedAtGt"
        field :updated_at_lt, -> { String }, optional: true, nullable: false, api_name: "updatedAtLt"
        field :updated_at_ge, -> { String }, optional: true, nullable: false, api_name: "updatedAtGe"
        field :updated_at_le, -> { String }, optional: true, nullable: false, api_name: "updatedAtLe"
      end
    end
  end
end
