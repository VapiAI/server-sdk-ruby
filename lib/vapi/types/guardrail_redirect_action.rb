# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailRedirectAction < Internal::Types::Model
      field :type, -> { Vapi::Types::GuardrailRedirectActionType }, optional: false, nullable: false
      field :instructions, -> { String }, optional: false, nullable: false
    end
  end
end
