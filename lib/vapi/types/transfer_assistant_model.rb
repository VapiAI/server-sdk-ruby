# frozen_string_literal: true

module Vapi
  module Types
    class TransferAssistantModel < Internal::Types::Model
      field :provider, -> { Vapi::Types::TransferAssistantModelProvider }, optional: false, nullable: false
      field :model, -> { String }, optional: false, nullable: false
      field :messages, -> { Internal::Types::Array[Object] }, optional: true, nullable: false
      field :tools, -> { Internal::Types::Array[Object] }, optional: true, nullable: false
    end
  end
end
