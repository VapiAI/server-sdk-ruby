# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailRuleConflictResponseDto < Internal::Types::Model
      field :error, -> { Vapi::Types::GuardrailRuleConflictResponseDtoError }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
