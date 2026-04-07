# frozen_string_literal: true

module Vapi
  module Types
    class CreateSesameVoiceDto < Internal::Types::Model
      field :voice_name, -> { String }, optional: true, nullable: false, api_name: "voiceName"
      field :transcription, -> { String }, optional: true, nullable: false
    end
  end
end
