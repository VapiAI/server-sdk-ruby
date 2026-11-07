# frozen_string_literal: true

module Vapi
  module Types
    class ToolVersionPaginatedMetadata < Internal::Types::Model
      field :next_cursor, -> { String }, optional: true, nullable: false, api_name: "nextCursor"
      field :has_next_page, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasNextPage"
      field :limit, -> { Integer }, optional: false, nullable: false
    end
  end
end
