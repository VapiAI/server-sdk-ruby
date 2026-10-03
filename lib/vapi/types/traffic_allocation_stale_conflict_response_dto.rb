# frozen_string_literal: true

module Vapi
  module Types
    class TrafficAllocationStaleConflictResponseDto < Internal::Types::Model
      field :error, -> { Vapi::Types::TrafficAllocationStaleConflictResponseDtoError }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :current_allocation_id, -> { String }, optional: true, nullable: false, api_name: "currentAllocationId"
    end
  end
end
