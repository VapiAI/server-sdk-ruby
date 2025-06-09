# frozen_string_literal: true

module Vapi
# This enforces the rubric of the evaluation. The output is stored in
#  `call.analysis.successEvaluation`.
#  Options include:
#  - 'NumericScale': A scale of 1 to 10.
#  - 'DescriptiveScale': A scale of Excellent, Good, Fair, Poor.
#  - 'Checklist': A checklist of criteria and their status.
#  - 'Matrix': A grid that evaluates multiple criteria across different performance
#  levels.
#  - 'PercentageScale': A scale of 0% to 100%.
#  - 'LikertScale': A scale of Strongly Agree, Agree, Neutral, Disagree, Strongly
#  Disagree.
#  - 'AutomaticRubric': Automatically break down evaluation into several criteria,
#  each with its own score.
#  - 'PassFail': A simple 'true' if call passed, 'false' if not.
#  Default is 'PassFail'.
  class SuccessEvaluationPlanRubric

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