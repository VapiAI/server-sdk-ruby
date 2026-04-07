# frozen_string_literal: true

module Vapi
  module Types
    class PaginationMeta < Internal::Types::Model
      field :items_per_page, -> { Integer }, optional: false, nullable: false, api_name: "itemsPerPage"
      field :total_items, -> { Integer }, optional: false, nullable: false, api_name: "totalItems"
      field :current_page, -> { Integer }, optional: false, nullable: false, api_name: "currentPage"
      field :items_beyond_retention, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "itemsBeyondRetention"
      field :created_at_le, -> { String }, optional: true, nullable: false, api_name: "createdAtLe"
      field :created_at_ge, -> { String }, optional: true, nullable: false, api_name: "createdAtGe"
    end
  end
end
