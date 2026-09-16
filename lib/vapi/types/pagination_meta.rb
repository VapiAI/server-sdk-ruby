# frozen_string_literal: true

module Vapi
  module Types
    # Pagination and retention metadata returned with a paginated list of phone numbers.
    class PaginationMeta < Internal::Types::Model
      field :items_per_page, -> { Integer }, optional: false, nullable: false, api_name: "itemsPerPage"
      field :total_items, -> { Integer }, optional: false, nullable: false, api_name: "totalItems"
      field :current_page, -> { Integer }, optional: false, nullable: false, api_name: "currentPage"
      field :total_pages, -> { Integer }, optional: true, nullable: false, api_name: "totalPages"
      field :has_next_page, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hasNextPage"
      field :next_cursor, -> { String }, optional: true, nullable: false, api_name: "nextCursor"
      field :sort_order, -> { Vapi::Types::PaginationMetaSortOrder }, optional: true, nullable: false, api_name: "sortOrder"
      field :items_beyond_retention, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "itemsBeyondRetention"
      field :created_at_le, -> { String }, optional: true, nullable: false, api_name: "createdAtLe"
      field :created_at_ge, -> { String }, optional: true, nullable: false, api_name: "createdAtGe"
    end
  end
end
