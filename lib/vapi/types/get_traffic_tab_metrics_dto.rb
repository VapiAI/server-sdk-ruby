# frozen_string_literal: true

module Vapi
  module Types
    class GetTrafficTabMetricsDto < Internal::Types::Model
      field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: false, nullable: false
      field :bucket, -> { Vapi::Types::GetTrafficTabMetricsDtoBucket }, optional: true, nullable: false
      field :structured_output_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "structuredOutputIds"
    end
  end
end
