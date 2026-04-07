# frozen_string_literal: true

module Vapi
  module Types
    module ExportChatDtoColumns
      extend Vapi::Internal::Types::Enum

      ID = "id"
      ASSISTANT_ID = "assistantId"
      SQUAD_ID = "squadId"
      SESSION_ID = "sessionId"
      PREVIOUS_CHAT_ID = "previousChatId"
      COST = "cost"
      MESSAGES = "messages"
      OUTPUT = "output"
      CREATED_AT = "createdAt"
      UPDATED_AT = "updatedAt"
    end
  end
end
