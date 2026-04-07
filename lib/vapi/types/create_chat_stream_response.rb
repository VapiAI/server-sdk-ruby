# frozen_string_literal: true

module Vapi
  module Types
    class CreateChatStreamResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :session_id, -> { String }, optional: true, nullable: false, api_name: "sessionId"
      field :path, -> { String }, optional: false, nullable: false
      field :delta, -> { String }, optional: false, nullable: false
    end
  end
end
