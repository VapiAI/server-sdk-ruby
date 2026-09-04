# frozen_string_literal: true

module Vapi
  module Types
    class CampaignCallMetrics < Internal::Types::Model
      field :dialed, -> { Integer }, optional: false, nullable: false
      field :connected, -> { Integer }, optional: false, nullable: false
    end
  end
end
