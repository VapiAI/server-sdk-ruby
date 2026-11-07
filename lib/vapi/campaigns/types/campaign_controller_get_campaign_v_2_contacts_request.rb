# frozen_string_literal: true

module Vapi
  module Campaigns
    module Types
      class CampaignControllerGetCampaignV2ContactsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :status, -> { Vapi::Campaigns::Types::CampaignControllerGetCampaignV2ContactsRequestStatusItem }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :sort_by, -> { Vapi::Campaigns::Types::CampaignControllerGetCampaignV2ContactsRequestSortBy }, optional: true, nullable: false, api_name: "sortBy"
        field :page, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
