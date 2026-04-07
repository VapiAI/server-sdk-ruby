# frozen_string_literal: true

module Vapi
  module Types
    class VoiceLibraryVoiceResponse < Internal::Types::Model
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :name, -> { String }, optional: false, nullable: false
      field :public_owner_id, -> { String }, optional: true, nullable: false, api_name: "publicOwnerId"
      field :description, -> { String }, optional: true, nullable: false
      field :gender, -> { String }, optional: true, nullable: false
      field :age, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :accent, -> { String }, optional: true, nullable: false
    end
  end
end
