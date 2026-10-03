# frozen_string_literal: true

module Vapi
  module Types
    # Result of the recording-consent flow, including consent type and the time consent was granted.
    class RecordingConsent < Internal::Types::Model
      field :type, -> { Vapi::Types::RecordingConsentType }, optional: false, nullable: false
      field :granted_at, -> { String }, optional: true, nullable: false, api_name: "grantedAt"
    end
  end
end
