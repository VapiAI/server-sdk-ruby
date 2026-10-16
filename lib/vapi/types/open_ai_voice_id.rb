# frozen_string_literal: true

module Vapi
  module Types
    # This is the provider-specific ID that will be used.
    # Voice availability depends on the selected model.
    # quartz, ripple, vesper, willow, stone, gleam, meridian, bossa, tempo, beacon, delta, cinder are only supported
    # with GPT-Live models.
    class OpenAiVoiceId < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::OpenAiVoiceIdEnum }
      member -> { String }
    end
  end
end
