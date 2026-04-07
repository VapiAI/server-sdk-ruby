# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageTranscript < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ServerMessageTranscriptPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ServerMessageTranscriptType }, optional: false, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :artifact, -> { Vapi::Types::Artifact }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :chat, -> { Vapi::Types::Chat }, optional: true, nullable: false
      field :role, -> { Vapi::Types::ServerMessageTranscriptRole }, optional: false, nullable: false
      field :transcript_type, -> { Vapi::Types::ServerMessageTranscriptTranscriptType }, optional: false, nullable: false, api_name: "transcriptType"
      field :transcript, -> { String }, optional: false, nullable: false
      field :is_filtered, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isFiltered"
      field :detected_threats, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "detectedThreats"
      field :original_transcript, -> { String }, optional: true, nullable: false, api_name: "originalTranscript"
    end
  end
end
