# frozen_string_literal: true

module Vapi
  module Types
    # Optional timing metadata. Shape depends on `timing.type`:
    #
    # - `word-alignment` (ElevenLabs): per-character timing at playback
    #   cadence. words[] includes space entries. Best consumed by tracking
    #   a running character count: join timing.words, add to a char cursor,
    #   and highlight text up to that position. No interpolation needed.
    #
    # - `word-progress` (Minimax with voice.subtitleType: 'word'): cursor-
    #   based word count per TTS segment. Use wordsSpoken as the anchor,
    #   interpolate forward using segmentDurationMs or timing.words until
    #   the next event arrives.
    #
    # When absent, the event is a text-only fallback for providers without
    # word-level timing (e.g. Cartesia, Deepgram, Azure). Text emits once
    # per TTS chunk when audio is playing. Optionally interpolate a word
    # cursor at ~3.5 words/sec between events for approximate tracking.
    class ServerMessageAssistantSpeechTiming < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::AssistantSpeechWordAlignmentTiming }, key: "WORD_ALIGNMENT"
      member -> { Vapi::Types::AssistantSpeechWordProgressTiming }, key: "WORD_PROGRESS"
    end
  end
end
