# frozen_string_literal: true

module Vapi
  module Types
    # A paginated collection of phone numbers and metadata describing the result set.
    class PhoneNumberPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::PhoneNumberPaginatedResponseResultsItem] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
    end
  end
end
