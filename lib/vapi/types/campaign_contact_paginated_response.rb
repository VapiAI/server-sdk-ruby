# frozen_string_literal: true

module Vapi
  module Types
    class CampaignContactPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::CampaignContactWithOutcome] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
    end
  end
end
