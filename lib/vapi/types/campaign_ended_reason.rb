# frozen_string_literal: true

module Vapi
  module Types
    module CampaignEndedReason
      extend Vapi::Internal::Types::Enum

      CAMPAIGN_SCHEDULED_ENDED_BY_USER = "campaign.scheduled.ended-by-user"
      CAMPAIGN_IN_PROGRESS_ENDED_BY_USER = "campaign.in-progress.ended-by-user"
      CAMPAIGN_ENDED_SUCCESS = "campaign.ended.success"
    end
  end
end
