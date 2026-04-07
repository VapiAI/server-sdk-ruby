# frozen_string_literal: true

module Vapi
  module Types
    class ChatEvalAssistantMessageMockToolCall < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :arguments, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
