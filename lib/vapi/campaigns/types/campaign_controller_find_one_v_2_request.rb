# frozen_string_literal: true

module Vapi
  module Campaigns
    module Types
      class CampaignControllerFindOneV2Request < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :include_counters, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeCounters"
      end
    end
  end
end
