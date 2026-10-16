# frozen_string_literal: true

module Vapi
  module Types
    # A simulated assistant tool call with the tool name and optional arguments.
    class ChatEvalAssistantMessageMockToolCall < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :arguments, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
