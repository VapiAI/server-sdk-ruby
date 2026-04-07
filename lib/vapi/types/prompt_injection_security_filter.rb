# frozen_string_literal: true

module Vapi
  module Types
    class PromptInjectionSecurityFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::PromptInjectionSecurityFilterType }, optional: false, nullable: false
    end
  end
end
