# frozen_string_literal: true

module Vapi
  module Types
    class TrafficAllocationVersionConflictResponseDto < Internal::Types::Model
      field :error, -> { Vapi::Types::TrafficAllocationVersionConflictResponseDtoError }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :governing_allocation_id, -> { String }, optional: false, nullable: false, api_name: "governingAllocationId"
    end
  end
end
