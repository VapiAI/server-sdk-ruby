# frozen_string_literal: true

module Vapi
  module Types
    class OpenAiSpeaker < Internal::Types::Model
      field :instructions, -> { String }, optional: true, nullable: false
      field :personality_packs, -> { Internal::Types::Array[Vapi::Types::OpenAiSpeakerPersonalityPacksItem] }, optional: true, nullable: false, api_name: "personalityPacks"
    end
  end
end
