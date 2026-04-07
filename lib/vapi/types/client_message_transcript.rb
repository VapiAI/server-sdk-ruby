# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessageTranscript < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ClientMessageTranscriptPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ClientMessageTranscriptType }, optional: false, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :role, -> { Vapi::Types::ClientMessageTranscriptRole }, optional: false, nullable: false
      field :transcript_type, -> { Vapi::Types::ClientMessageTranscriptTranscriptType }, optional: false, nullable: false, api_name: "transcriptType"
      field :transcript, -> { String }, optional: false, nullable: false
      field :is_filtered, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isFiltered"
      field :detected_threats, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "detectedThreats"
      field :original_transcript, -> { String }, optional: true, nullable: false, api_name: "originalTranscript"
    end
  end
end
