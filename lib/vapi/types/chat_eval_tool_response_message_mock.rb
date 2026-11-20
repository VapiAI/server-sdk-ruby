# frozen_string_literal: true

module Vapi
  module Types
    # A simulated tool response in an evaluation conversation.
    class ChatEvalToolResponseMessageMock < Internal::Types::Model
      field :role, -> { Vapi::Types::ChatEvalToolResponseMessageMockRole }, optional: false, nullable: false
      field :content, -> { String }, optional: false, nullable: false
    end
  end
end
