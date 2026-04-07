# frozen_string_literal: true

module Vapi
  module Chats
    module Types
      class CreateResponseChatsResponse < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        member -> { Vapi::Types::ResponseObject }
        member -> { Vapi::Types::ResponseTextDeltaEvent }
        member -> { Vapi::Types::ResponseTextDoneEvent }
        member -> { Vapi::Types::ResponseCompletedEvent }
        member -> { Vapi::Types::ResponseErrorEvent }
      end
    end
  end
end
