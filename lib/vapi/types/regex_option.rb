# frozen_string_literal: true

module Vapi
  module Types
    class RegexOption < Internal::Types::Model
      field :type, -> { Vapi::Types::RegexOptionType }, optional: false, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
