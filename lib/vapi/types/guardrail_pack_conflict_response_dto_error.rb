# frozen_string_literal: true

module Vapi
  module Types
    module GuardrailPackConflictResponseDtoError
      extend Vapi::Internal::Types::Enum

      PACK_CHANGED = "pack_changed"
      IMPACT_CHANGED = "impact_changed"
      GLOBAL_ASSIGNMENT = "global_assignment"
    end
  end
end
