# frozen_string_literal: true

module Vapi
  module Types
    class ResponseOutputMessage < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :content, -> { Internal::Types::Array[Vapi::Types::ResponseOutputText] }, optional: false, nullable: false
      field :role, -> { Vapi::Types::ResponseOutputMessageRole }, optional: false, nullable: false
      field :status, -> { Vapi::Types::ResponseOutputMessageStatus }, optional: false, nullable: false
      field :type, -> { Vapi::Types::ResponseOutputMessageType }, optional: false, nullable: false
    end
  end
end
