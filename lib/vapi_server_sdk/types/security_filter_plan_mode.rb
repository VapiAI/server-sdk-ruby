# frozen_string_literal: true

module Vapi
  # Mode of operation when a security threat is detected.
  #  - 'sanitize': Remove or replace the threatening content
  #  - 'reject': Replace the entire transcript with replacement text
  #  - 'replace': Replace threatening patterns with replacement text
  #  @default 'sanitize'
  class SecurityFilterPlanMode
    SANITIZE = "sanitize"
    REJECT = "reject"
    REPLACE = "replace"
  end
end
