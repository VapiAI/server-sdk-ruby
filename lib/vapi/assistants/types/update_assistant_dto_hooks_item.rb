# frozen_string_literal: true

module Vapi
  module Assistants
    module Types
      class UpdateAssistantDtoHooksItem < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        member -> { Vapi::Types::CallHookCallEnding }
        member -> { Vapi::Types::CallHookAssistantSpeechInterrupted }
        member -> { Vapi::Types::CallHookCustomerSpeechInterrupted }
        member -> { Vapi::Types::CallHookCustomerSpeechTimeout }
        member -> { Vapi::Types::SessionCreatedHook }
      end
    end
  end
end
