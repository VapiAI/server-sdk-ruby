# frozen_string_literal: true

module Vapi
  module Types
    class GetTrafficAllocationPaginatedDto < Internal::Types::Model
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :page, -> { Integer }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :sort_order, -> { Vapi::Types::GetTrafficAllocationPaginatedDtoSortOrder }, optional: true, nullable: false, api_name: "sortOrder"
    end
  end
end
