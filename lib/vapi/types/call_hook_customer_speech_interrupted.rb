# frozen_string_literal: true

module Vapi
  module Types
    class CallHookCustomerSpeechInterrupted < Internal::Types::Model
      field :on, -> { Vapi::Types::CallHookCustomerSpeechInterruptedOn }, optional: false, nullable: false
      field :do_, -> { Internal::Types::Array[Vapi::Types::CallHookCustomerSpeechInterruptedDoItem] }, optional: false, nullable: false, api_name: "do"
    end
  end
end
