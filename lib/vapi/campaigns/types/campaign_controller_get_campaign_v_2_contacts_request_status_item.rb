# frozen_string_literal: true

module Vapi
  module Campaigns
    module Types
      module CampaignControllerGetCampaignV2ContactsRequestStatusItem
        extend Vapi::Internal::Types::Enum

        CONTACT_PENDING = "contact.pending"
        CONTACT_DISPATCHED = "contact.dispatched"
        CONTACT_COMPLETED = "contact.completed"
        CONTACT_FAILED = "contact.failed"
        CONTACT_SKIPPED = "contact.skipped"
        CONTACT_PREDIAL_FAILED = "contact.predial-failed"
      end
    end
  end
end
