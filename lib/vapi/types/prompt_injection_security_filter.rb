# frozen_string_literal: true

module Vapi
  module Types
    # Filters potential prompt-injection patterns from transcripts.
    class PromptInjectionSecurityFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::PromptInjectionSecurityFilterType }, optional: false, nullable: false
    end
  end
end
