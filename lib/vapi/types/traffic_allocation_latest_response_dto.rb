# frozen_string_literal: true

module Vapi
  module Types
    class TrafficAllocationLatestResponseDto < Internal::Types::Model
      field :allocation, -> { Vapi::Types::TrafficAllocation }, optional: true, nullable: false
    end
  end
end
