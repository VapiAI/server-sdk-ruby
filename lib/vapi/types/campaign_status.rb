# frozen_string_literal: true

module Vapi
  module Types
    module CampaignStatus
      extend Vapi::Internal::Types::Enum

      SCHEDULED = "scheduled"
      IN_PROGRESS = "in-progress"
      ENDED = "ended"
    end
  end
end
