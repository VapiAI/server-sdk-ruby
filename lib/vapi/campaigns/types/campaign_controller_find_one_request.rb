# frozen_string_literal: true

module Vapi
  module Campaigns
    module Types
      class CampaignControllerFindOneRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
