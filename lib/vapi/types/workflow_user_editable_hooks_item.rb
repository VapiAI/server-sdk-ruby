# frozen_string_literal: true

module Vapi
  module Types
    class WorkflowUserEditableHooksItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::CallHookCallEnding }
      member -> { Vapi::Types::CallHookAssistantSpeechInterrupted }
      member -> { Vapi::Types::CallHookCustomerSpeechInterrupted }
      member -> { Vapi::Types::CallHookCustomerSpeechTimeout }
      member -> { Vapi::Types::CallHookModelResponseTimeout }
    end
  end
end
