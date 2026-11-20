# frozen_string_literal: true

module Vapi
  module Types
    class VapiWebsocketTransport < Internal::Types::Model
      field :conversation_type, -> { Vapi::Types::VapiWebsocketTransportConversationType }, optional: true, nullable: false, api_name: "conversationType"
      field :audio_format, -> { Vapi::Types::AudioFormat }, optional: true, nullable: false, api_name: "audioFormat"
    end
  end
end
