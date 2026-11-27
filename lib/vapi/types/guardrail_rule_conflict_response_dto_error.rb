# frozen_string_literal: true

module Vapi
  module Types
    module GuardrailRuleConflictResponseDtoError
      extend Vapi::Internal::Types::Enum

      RULE_CHANGED = "rule_changed"
      IMPACT_CHANGED = "impact_changed"
      GLOBAL_ASSIGNMENT = "global_assignment"
    end
  end
end
