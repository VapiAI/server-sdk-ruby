# frozen_string_literal: true

module Vapi
  module Types
    # A paginated collection of outbound calling campaigns and metadata describing the result set.
    class CampaignPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::Campaign] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
    end
  end
end
