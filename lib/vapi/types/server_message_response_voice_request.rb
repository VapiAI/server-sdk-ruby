# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageResponseVoiceRequest < Internal::Types::Model
      field :data, -> { String }, optional: false, nullable: false
    end
  end
end
