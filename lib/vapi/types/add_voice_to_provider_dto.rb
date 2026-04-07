# frozen_string_literal: true

module Vapi
  module Types
    class AddVoiceToProviderDto < Internal::Types::Model
      field :owner_id, -> { String }, optional: false, nullable: false, api_name: "ownerId"
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
