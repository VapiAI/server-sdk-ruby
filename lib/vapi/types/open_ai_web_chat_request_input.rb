# frozen_string_literal: true

module Vapi
  module Types
    # This is the input text for the chat.
    # Can be a string or an array of chat messages.
    class OpenAiWebChatRequestInput < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Internal::Types::Array[Vapi::Types::OpenAiWebChatRequestInputOneItem] }
    end
  end
end
