# frozen_string_literal: true

module Vapi
  module Eval
    module Types
      class UpdateEvalDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :messages, -> { Internal::Types::Array[Vapi::Eval::Types::UpdateEvalDtoMessagesItem] }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :description, -> { String }, optional: true, nullable: false
        field :type, -> { Vapi::Eval::Types::UpdateEvalDtoType }, optional: true, nullable: false
      end
    end
  end
end
