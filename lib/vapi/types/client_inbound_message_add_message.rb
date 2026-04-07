# frozen_string_literal: true

module Vapi
  module Types
    class ClientInboundMessageAddMessage < Internal::Types::Model
      field :message, -> { Vapi::Types::OpenAiMessage }, optional: false, nullable: false
      field :trigger_response_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "triggerResponseEnabled"
    end
  end
end
