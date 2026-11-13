# frozen_string_literal: true

module Vapi
  module Types
    # Enables or disables one regular-expression matching option for a text replacement.
    class RegexOption < Internal::Types::Model
      field :type, -> { Vapi::Types::RegexOptionType }, optional: false, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
