# frozen_string_literal: true

module Vapi
  module Sessions
    module Types
      module ListSessionsRequestSortBy
        extend Vapi::Internal::Types::Enum

        CREATED_AT = "createdAt"
        DURATION = "duration"
        COST = "cost"
      end
    end
  end
end
