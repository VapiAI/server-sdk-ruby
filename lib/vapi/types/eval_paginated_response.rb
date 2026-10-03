# frozen_string_literal: true

module Vapi
  module Types
    # A paginated collection of saved eval definitions and metadata describing the result set.
    class EvalPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::Eval] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
    end
  end
end
