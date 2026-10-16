# frozen_string_literal: true

module Vapi
  module Types
    # A paginated collection of saved reporting insights and metadata describing the result set.
    class InsightPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::Insight] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
    end
  end
end
