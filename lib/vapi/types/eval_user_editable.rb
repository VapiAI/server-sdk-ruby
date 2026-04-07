# frozen_string_literal: true

module Vapi
  module Types
    class EvalUserEditable < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::EvalUserEditableMessagesItem] }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :type, -> { Vapi::Types::EvalUserEditableType }, optional: false, nullable: false
    end
  end
end
