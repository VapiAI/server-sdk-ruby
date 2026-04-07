# frozen_string_literal: true

module Vapi
  module Campaigns
    module Types
      class CampaignControllerRemoveRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
