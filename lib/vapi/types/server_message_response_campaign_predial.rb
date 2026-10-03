# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageResponseCampaignPredial < Internal::Types::Model
      field :eligible, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
