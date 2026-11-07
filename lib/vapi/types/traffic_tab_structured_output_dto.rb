# frozen_string_literal: true

module Vapi
  module Types
    class TrafficTabStructuredOutputDto < Internal::Types::Model
      field :structured_output_id, -> { String }, optional: false, nullable: false, api_name: "structuredOutputId"
      field :type, -> { Vapi::Types::TrafficTabStructuredOutputDtoType }, optional: false, nullable: false
      field :present, -> { Integer }, optional: false, nullable: false
      field :numeric, -> { Vapi::Types::TrafficTabStructuredOutputNumericDto }, optional: true, nullable: false
      field :value_counts, -> { Internal::Types::Array[Vapi::Types::TrafficTabStructuredOutputValueCountDto] }, optional: true, nullable: false, api_name: "valueCounts"
    end
  end
end
