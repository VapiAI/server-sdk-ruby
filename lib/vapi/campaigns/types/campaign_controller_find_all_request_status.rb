# frozen_string_literal: true

module Vapi
  module Campaigns
    module Types
      module CampaignControllerFindAllRequestStatus
        extend Vapi::Internal::Types::Enum

        SCHEDULED = "scheduled"
        IN_PROGRESS = "in-progress"
        ENDED = "ended"
        CANCELLED = "cancelled"
        ARCHIVED = "archived"
      end
    end
  end
end
