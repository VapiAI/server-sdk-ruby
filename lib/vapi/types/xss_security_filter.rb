# frozen_string_literal: true

module Vapi
  module Types
    # Filters potential cross-site scripting (XSS) patterns from transcripts.
    class XssSecurityFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::XssSecurityFilterType }, optional: false, nullable: false
    end
  end
end
