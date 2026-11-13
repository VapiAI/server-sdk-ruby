# frozen_string_literal: true

module Vapi
  module Types
    class TransferAssistantHooksItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::CallHookAssistantSpeechInterrupted }
      member -> { Vapi::Types::CallHookCustomerSpeechInterrupted }
      member -> { Vapi::Types::CallHookCustomerSpeechTimeout }
      member -> { Vapi::Types::CallHookModelResponseTimeout }
      member -> { Vapi::Types::CallHookTranscriberEndpointedSpeechLowConfidence }
    end
  end
end
