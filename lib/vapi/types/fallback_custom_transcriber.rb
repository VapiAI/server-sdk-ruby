# frozen_string_literal: true

module Vapi
  module Types
    # Fallback configuration for sending conversation audio to a custom WebSocket transcription server.
    class FallbackCustomTranscriber < Internal::Types::Model
      field :server, -> { Vapi::Types::Server }, optional: false, nullable: false
    end
  end
end
