# frozen_string_literal: true

module Vapi
  module Types
    class LegacyAssistantVersionPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::LegacyAssistantVersion] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
      field :next_page_state, -> { String }, optional: true, nullable: false, api_name: "nextPageState"
    end
  end
end
