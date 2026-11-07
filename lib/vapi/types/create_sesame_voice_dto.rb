# frozen_string_literal: true

module Vapi
  module Types
    class CreateSesameVoiceDto < Internal::Types::Model
      field :file, -> { String }, optional: false, nullable: false
      field :voice_name, -> { String }, optional: false, nullable: false, api_name: "voiceName"
      field :transcription, -> { String }, optional: false, nullable: false
    end
  end
end
