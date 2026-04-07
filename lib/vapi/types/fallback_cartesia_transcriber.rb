# frozen_string_literal: true

module Vapi
  module Types
    class FallbackCartesiaTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackCartesiaTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackCartesiaTranscriberLanguage }, optional: true, nullable: false
    end
  end
end
