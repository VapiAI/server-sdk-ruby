# frozen_string_literal: true

module Vapi
  module Types
    class FallbackOpenAiTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackOpenAiTranscriberModel }, optional: false, nullable: false
      field :language, -> { Vapi::Types::FallbackOpenAiTranscriberLanguage }, optional: true, nullable: false
    end
  end
end
