# frozen_string_literal: true

module Vapi
  module Types
    # Compliance information captured for a call, including recording consent.
    class Compliance < Internal::Types::Model
      field :recording_consent, -> { Vapi::Types::RecordingConsent }, optional: true, nullable: false, api_name: "recordingConsent"
    end
  end
end
