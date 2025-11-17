# frozen_string_literal: true

module Vapi
  # This is the status of the eval run result.
  #  The status is only 'pass' or 'fail' for an eval run result.
  #  Currently, An eval is considered `pass` only if all the Assistant Judge messages
  #  are evaluated to pass.
  class EvalRunResultStatus
    PASS = "pass"
    FAIL = "fail"
  end
end
