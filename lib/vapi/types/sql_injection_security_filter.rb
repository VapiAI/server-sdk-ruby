# frozen_string_literal: true

module Vapi
  module Types
    # Filters potential SQL injection patterns from transcripts.
    class SqlInjectionSecurityFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::SqlInjectionSecurityFilterType }, optional: false, nullable: false
    end
  end
end
