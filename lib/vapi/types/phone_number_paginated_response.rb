# frozen_string_literal: true

module Vapi
  module Types
    class PhoneNumberPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::PhoneNumberPaginatedResponseResultsItem] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
    end
  end
end
