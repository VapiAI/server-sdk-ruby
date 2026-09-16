# frozen_string_literal: true

module Vapi
  module Types
    # Configuration used to create a reusable eval containing a mock conversation and checkpoints for assessing
    # assistant responses and tool calls.
    class CreateEvalDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateEvalDtoMessagesItem] }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :type, -> { Vapi::Types::CreateEvalDtoType }, optional: false, nullable: false
    end
  end
end
