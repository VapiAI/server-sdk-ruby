# frozen_string_literal: true

module Vapi
  module Types
    class CreateGuardrailRuleDtoActionZero < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :mode

      member -> { Vapi::Types::GuardrailFixedResponseAction }, key: "FIXED"
      member -> { Vapi::Types::GuardrailRedirectAction }, key: "REDIRECT"
    end
  end
end
