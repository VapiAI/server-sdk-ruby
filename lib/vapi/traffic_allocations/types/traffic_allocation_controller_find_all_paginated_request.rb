# frozen_string_literal: true

module Vapi
  module TrafficAllocations
    module Types
      class TrafficAllocationControllerFindAllPaginatedRequest < Internal::Types::Model
        field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
        field :page, -> { Integer }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :sort_order, -> { Vapi::TrafficAllocations::Types::TrafficAllocationControllerFindAllPaginatedRequestSortOrder }, optional: true, nullable: false, api_name: "sortOrder"
      end
    end
  end
end
