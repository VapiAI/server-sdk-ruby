# frozen_string_literal: true

module Vapi
  module TrafficAllocations
    module Types
      class TrafficAllocationControllerLatestGetRequest < Internal::Types::Model
        field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
      end
    end
  end
end
