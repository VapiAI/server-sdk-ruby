# frozen_string_literal: true

module Vapi
  module TrafficAllocations
    module Types
      class TrafficAllocationControllerMetricsGetRequest < Internal::Types::Model
        field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
        field :from, -> { String }, optional: false, nullable: false
        field :to, -> { String }, optional: false, nullable: false
        field :bucket, -> { Vapi::TrafficAllocations::Types::TrafficAllocationControllerMetricsGetRequestBucket }, optional: true, nullable: false
        field :structured_output_ids, -> { String }, optional: true, nullable: false, api_name: "structuredOutputIds"
      end
    end
  end
end
