# frozen_string_literal: true

module Vapi
  module Types
    class WebChat < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :session_id, -> { String }, optional: true, nullable: false, api_name: "sessionId"
      field :output, -> { Internal::Types::Array[Vapi::Types::WebChatOutputItem] }, optional: false, nullable: false
    end
  end
end
