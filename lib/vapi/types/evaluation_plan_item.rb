# frozen_string_literal: true

module Vapi
  module Types
    class EvaluationPlanItem < Internal::Types::Model
      field :structured_output_id, -> { String }, optional: true, nullable: false, api_name: "structuredOutputId"
      field :structured_output, -> { Vapi::Types::CreateStructuredOutputDto }, optional: true, nullable: false, api_name: "structuredOutput"
      field :comparator, -> { Vapi::Types::EvaluationPlanItemComparator }, optional: false, nullable: false
      field :value, -> { Vapi::Types::EvaluationPlanItemValue }, optional: false, nullable: false
      field :required, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
