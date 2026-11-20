# frozen_string_literal: true

module Vapi
  module Types
    # Supplied PATCH actions replace the complete variant.
    class GuardrailRuleSnapshotAction < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::GuardrailRuleSnapshotActionZero }
      member -> { Vapi::Types::GuardrailEscalateAction }
    end
  end
end
