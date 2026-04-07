# frozen_string_literal: true

module Vapi
  module Types
    # This is the provider-specific ID that will be used. Ensure the Voice is present in your 11Labs Voice Library.
    class FallbackElevenLabsVoiceId < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::FallbackElevenLabsVoiceIdEnum }
      member -> { String }
    end
  end
end
