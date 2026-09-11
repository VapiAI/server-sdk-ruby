# frozen_string_literal: true

module Vapi
  module Types
    # Evaluates whether targeted conversation-message content matches a regular expression.
    class RegexCondition < Internal::Types::Model
      field :regex, -> { String }, optional: false, nullable: false
      field :target, -> { Vapi::Types::MessageTarget }, optional: true, nullable: false
      field :negate, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
