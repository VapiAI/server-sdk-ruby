# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageCallArtifactUpload < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ServerMessageCallArtifactUploadPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :assistant_version, -> { String }, optional: true, nullable: false, api_name: "assistantVersion"
      field :type, -> { Vapi::Types::ServerMessageCallArtifactUploadType }, optional: false, nullable: false
      field :artifacts, -> { Internal::Types::Array[Vapi::Types::CallArtifactUploadItem] }, optional: false, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :artifact, -> { Vapi::Types::Artifact }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :chat, -> { Vapi::Types::Chat }, optional: true, nullable: false
    end
  end
end
