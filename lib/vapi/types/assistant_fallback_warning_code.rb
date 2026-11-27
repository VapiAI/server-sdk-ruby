# frozen_string_literal: true

module Vapi
  module Types
    module AssistantFallbackWarningCode
      extend Vapi::Internal::Types::Enum

      FALLBACK_VOICES_EMPTY = "fallback-voices-empty"
      FALLBACK_VOICE_SAME_PROVIDER = "fallback-voice-same-provider"
      FALLBACK_VOICE_LANGUAGE_UNSUPPORTED = "fallback-voice-language-unsupported"
      FALLBACK_VOICE_INVALID = "fallback-voice-invalid"
      FALLBACK_TRANSCRIBERS_EMPTY = "fallback-transcribers-empty"
      FALLBACK_TRANSCRIBER_SAME_PROVIDER = "fallback-transcriber-same-provider"
      FALLBACK_TRANSCRIBER_LANGUAGE_UNSUPPORTED = "fallback-transcriber-language-unsupported"
    end
  end
end
