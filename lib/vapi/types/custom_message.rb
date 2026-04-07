# frozen_string_literal: true

module Vapi
  module Types
    class CustomMessage < Internal::Types::Model
      field :contents, -> { Internal::Types::Array[Vapi::Types::TextContent] }, optional: true, nullable: false
      field :type, -> { Vapi::Types::CustomMessageType }, optional: false, nullable: false
      field :content, -> { String }, optional: true, nullable: false
    end
  end
end
