# frozen_string_literal: true

module Vapi
  module Types
    # Supplied PATCH actions replace the complete variant.
    class SaveGuardrailRuleDtoAction < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::SaveGuardrailRuleDtoActionZero }
      member -> { Vapi::Types::GuardrailEscalateAction }
    end
  end
end
