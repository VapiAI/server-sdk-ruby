# frozen_string_literal: true

module Vapi
  module Types
    class CreateEvalDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateEvalDtoMessagesItem] }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :type, -> { Vapi::Types::CreateEvalDtoType }, optional: false, nullable: false
    end
  end
end
