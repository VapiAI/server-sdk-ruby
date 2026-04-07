# frozen_string_literal: true

module Vapi
  module Types
    class CallHookAssistantSpeechInterrupted < Internal::Types::Model
      field :on, -> { Vapi::Types::CallHookAssistantSpeechInterruptedOn }, optional: false, nullable: false
      field :do_, -> { Internal::Types::Array[Vapi::Types::CallHookAssistantSpeechInterruptedDoItem] }, optional: false, nullable: false, api_name: "do"
    end
  end
end
