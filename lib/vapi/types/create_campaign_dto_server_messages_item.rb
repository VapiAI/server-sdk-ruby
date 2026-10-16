# frozen_string_literal: true

module Vapi
  module Types
    module CreateCampaignDtoServerMessagesItem
      extend Vapi::Internal::Types::Enum

      CAMPAIGN_STARTED = "campaign.started"
      CAMPAIGN_CANCELLED = "campaign.cancelled"
      CAMPAIGN_ENDED = "campaign.ended"
      CAMPAIGN_ARCHIVED = "campaign.archived"
      CAMPAIGN_UNARCHIVED = "campaign.unarchived"
      CONTACT_DISPATCHED = "contact.dispatched"
      CONTACT_COMPLETED = "contact.completed"
      CONTACT_FAILED = "contact.failed"
      CONTACT_SKIPPED = "contact.skipped"
      CONTACT_PREDIAL_FAILED = "contact.predial-failed"
      CAMPAIGN_JOB_CONTINUED = "campaign.job.continued"
    end
  end
end
