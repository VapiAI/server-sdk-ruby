# frozen_string_literal: true

module Vapi
  module Types
    class TransferArtifact < Internal::Types::Model
      field :destination, -> { Vapi::Types::TransferArtifactDestination }, optional: false, nullable: false
      field :mode, -> { Vapi::Types::TransferArtifactMode }, optional: true, nullable: false
      field :transcript, -> { String }, optional: true, nullable: false
      field :status, -> { Vapi::Types::TransferArtifactStatus }, optional: true, nullable: false
      field :messages, -> { Internal::Types::Array[Vapi::Types::TransferArtifactMessagesItem] }, optional: true, nullable: false
    end
  end
end
