# frozen_string_literal: true

module Vapi
  module Types
    class CampaignContactCounters < Internal::Types::Model
      field :pending, -> { Integer }, optional: false, nullable: false
      field :dispatched, -> { Integer }, optional: false, nullable: false
      field :completed, -> { Integer }, optional: false, nullable: false
      field :failed, -> { Integer }, optional: false, nullable: false
      field :skipped, -> { Integer }, optional: false, nullable: false
      field :predial_failed, -> { Integer }, optional: false, nullable: false, api_name: "predialFailed"
    end
  end
end
