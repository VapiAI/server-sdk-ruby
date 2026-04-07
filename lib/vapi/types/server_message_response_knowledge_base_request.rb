# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageResponseKnowledgeBaseRequest < Internal::Types::Model
      field :documents, -> { Internal::Types::Array[Vapi::Types::KnowledgeBaseResponseDocument] }, optional: true, nullable: false
      field :message, -> { Vapi::Types::CustomMessage }, optional: true, nullable: false
    end
  end
end
