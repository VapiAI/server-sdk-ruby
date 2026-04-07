# frozen_string_literal: true

module Vapi
  module Types
    class ChatEvalUserMessageMock < Internal::Types::Model
      field :role, -> { Vapi::Types::ChatEvalUserMessageMockRole }, optional: false, nullable: false
      field :content, -> { String }, optional: false, nullable: false
    end
  end
end
