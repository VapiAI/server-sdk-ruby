# frozen_string_literal: true

module Vapi
  module Types
    # A paginated collection of scorecards and metadata describing the result set.
    class ScorecardPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::Scorecard] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
    end
  end
end
