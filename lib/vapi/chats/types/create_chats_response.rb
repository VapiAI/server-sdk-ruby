# frozen_string_literal: true

module Vapi
  module Chats
    module Types
      class CreateChatsResponse < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        member -> { Vapi::Types::Chat }
        member -> { Vapi::Types::CreateChatStreamResponse }
      end
    end
  end
end
