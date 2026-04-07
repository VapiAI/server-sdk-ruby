# frozen_string_literal: true

module Vapi
  module Types
    class ClientInboundMessageSay < Internal::Types::Model
      field :interrupt_assistant_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "interruptAssistantEnabled"
      field :content, -> { String }, optional: true, nullable: false
      field :end_call_after_spoken, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "endCallAfterSpoken"
      field :interruptions_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "interruptionsEnabled"
    end
  end
end
