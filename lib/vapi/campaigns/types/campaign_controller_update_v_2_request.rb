# frozen_string_literal: true

module Vapi
  module Campaigns
    module Types
      class CampaignControllerUpdateV2Request < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :body, -> { Vapi::Types::UpdateCampaignDto }, optional: false, nullable: false
      end
    end
  end
end
