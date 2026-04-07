# frozen_string_literal: true

module Vapi
  module Types
    class ProviderResourcePaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::ProviderResource] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
    end
  end
end
