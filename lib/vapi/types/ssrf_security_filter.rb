# frozen_string_literal: true

module Vapi
  module Types
    # Filters potential server-side request forgery (SSRF) patterns from transcripts.
    class SsrfSecurityFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::SsrfSecurityFilterType }, optional: false, nullable: false
    end
  end
end
