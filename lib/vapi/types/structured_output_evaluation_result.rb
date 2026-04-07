# frozen_string_literal: true

module Vapi
  module Types
    class StructuredOutputEvaluationResult < Internal::Types::Model
      field :structured_output_id, -> { String }, optional: false, nullable: false, api_name: "structuredOutputId"
      field :name, -> { String }, optional: false, nullable: false
      field :extracted_value, -> { Vapi::Types::StructuredOutputEvaluationResultExtractedValue }, optional: false, nullable: true, api_name: "extractedValue"
      field :expected_value, -> { Vapi::Types::StructuredOutputEvaluationResultExpectedValue }, optional: false, nullable: false, api_name: "expectedValue"
      field :comparator, -> { Vapi::Types::StructuredOutputEvaluationResultComparator }, optional: false, nullable: false
      field :passed, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :required, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :error, -> { String }, optional: true, nullable: false
      field :is_skipped, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isSkipped"
      field :skip_reason, -> { String }, optional: true, nullable: false, api_name: "skipReason"
    end
  end
end
