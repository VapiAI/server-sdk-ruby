# frozen_string_literal: true

module Vapi
  module Types
    # This is the provider-specific ID that will be used.
    # Please note that ash, ballad, coral, sage, and verse may only be used with realtime models.
    class FallbackOpenAiVoiceId < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::FallbackOpenAiVoiceIdEnum }
      member -> { String }
    end
  end
end
