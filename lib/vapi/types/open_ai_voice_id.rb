# frozen_string_literal: true

module Vapi
  module Types
    # This is the provider-specific ID that will be used.
    # Voice availability depends on the selected model: voices offered only by GPT-Live are rejected for other models.
    class OpenAiVoiceId < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::OpenAiVoiceIdEnum }
      member -> { String }
    end
  end
end
