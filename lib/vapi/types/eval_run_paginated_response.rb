# frozen_string_literal: true

module Vapi
  module Types
    # A paginated collection of eval runs and metadata describing the result set.
    class EvalRunPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::EvalRun] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
    end
  end
end
