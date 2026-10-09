# frozen_string_literal: true

module Vapi
  module Campaigns
    module Types
      class CampaignControllerUpdateRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :body, -> { Vapi::Types::UpdateCampaignDto }, optional: false, nullable: false
      end
    end
  end
end
