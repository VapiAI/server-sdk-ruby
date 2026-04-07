# frozen_string_literal: true

module Vapi
  module Types
    class ChatEvalSystemMessageMock < Internal::Types::Model
      field :role, -> { Vapi::Types::ChatEvalSystemMessageMockRole }, optional: false, nullable: false
      field :content, -> { String }, optional: false, nullable: false
    end
  end
end
