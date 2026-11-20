# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailFixedResponseAction < Internal::Types::Model
      field :type, -> { Vapi::Types::GuardrailFixedResponseActionType }, optional: false, nullable: false
      field :text, -> { String }, optional: false, nullable: false
    end
  end
end
