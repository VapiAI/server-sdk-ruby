# frozen_string_literal: true

module Vapi
  module TrafficAllocations
    module Types
      class CreateTrafficAllocationDto < Internal::Types::Model
        field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
        field :allocation_intent, -> { Vapi::TrafficAllocations::Types::CreateTrafficAllocationDtoAllocationIntent }, optional: true, nullable: false, api_name: "allocationIntent"
        field :targets, -> { Internal::Types::Array[Vapi::Types::CreateTrafficAllocationTargetDto] }, optional: true, nullable: false
        field :expected_current_allocation_id, -> { String }, optional: true, nullable: false, api_name: "expectedCurrentAllocationId"
        field :description, -> { String }, optional: true, nullable: false
      end
    end
  end
end
