# frozen_string_literal: true

module Vapi
  module Types
    class FallbackTalkscriberTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackTalkscriberTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackTalkscriberTranscriberLanguage }, optional: true, nullable: false
    end
  end
end
