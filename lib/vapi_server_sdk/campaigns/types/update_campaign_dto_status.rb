# frozen_string_literal: true

module Vapi
  class Campaigns
    # This is the status of the campaign.
    #  Can only be updated to 'ended' if you want to end the campaign.
    #  When set to 'ended', it will delete all scheduled calls. Calls in progress will
    #  be allowed to complete.
    class UpdateCampaignDtoStatus
      ENDED = "ended"
    end
  end
end
