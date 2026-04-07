# frozen_string_literal: true

module Vapi
  module Chats
    module Types
      # This is the input text for the chat.
      # Can be a string or an array of chat messages.
      # This field is REQUIRED for chat creation.
      class CreateChatDtoInput < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        member -> { String }
        member -> { Internal::Types::Array[Vapi::Chats::Types::CreateChatDtoInputOneItem] }
      end
    end
  end
end
