# frozen_string_literal: true

module Vapi
  module Types
    # A word or phrase to prioritize during Speechmatics transcription, with optional phonetic alternatives.
    class SpeechmaticsCustomVocabularyItem < Internal::Types::Model
      field :content, -> { String }, optional: false, nullable: false
      field :sounds_like, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "soundsLike"
    end
  end
end
