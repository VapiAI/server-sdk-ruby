# frozen_string_literal: true

module Vapi
  module Types
    module SuccessEvaluationPlanRubric
      extend Vapi::Internal::Types::Enum

      NUMERIC_SCALE = "NumericScale"
      DESCRIPTIVE_SCALE = "DescriptiveScale"
      CHECKLIST = "Checklist"
      MATRIX = "Matrix"
      PERCENTAGE_SCALE = "PercentageScale"
      LIKERT_SCALE = "LikertScale"
      AUTOMATIC_RUBRIC = "AutomaticRubric"
      PASS_FAIL = "PassFail"
    end
  end
end
