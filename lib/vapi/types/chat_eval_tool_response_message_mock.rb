# frozen_string_literal: true

module Vapi
  module Types
    class ChatEvalToolResponseMessageMock < Internal::Types::Model
      field :role, -> { Vapi::Types::ChatEvalToolResponseMessageMockRole }, optional: false, nullable: false
      field :content, -> { String }, optional: false, nullable: false
    end
  end
end
