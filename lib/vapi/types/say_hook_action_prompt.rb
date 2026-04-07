# frozen_string_literal: true

module Vapi
  module Types
    # This is the prompt for the assistant to generate a response based on existing conversation.
    # Can be a string or an array of chat messages.
    class SayHookActionPrompt < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Internal::Types::Array[Vapi::Types::SayHookActionPromptOneItem] }
    end
  end
end
