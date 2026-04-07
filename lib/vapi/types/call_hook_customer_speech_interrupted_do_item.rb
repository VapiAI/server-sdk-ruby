# frozen_string_literal: true

module Vapi
  module Types
    class CallHookCustomerSpeechInterruptedDoItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::SayHookAction }, key: "SAY"
      member -> { Vapi::Types::ToolCallHookAction }, key: "TOOL"
      member -> { Vapi::Types::MessageAddHookAction }, key: "MESSAGE_ADD"
    end
  end
end
