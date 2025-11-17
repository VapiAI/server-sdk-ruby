# frozen_string_literal: true

module Vapi
  # This is the type of the message. "knowledge-base-request" is sent to request
  #  knowledge base documents. To enable, use
  #  `assistant.knowledgeBase.provider=custom-knowledge-base`.
  class ServerMessageKnowledgeBaseRequestType
    KNOWLEDGE_BASE_REQUEST = "knowledge-base-request"
  end
end
