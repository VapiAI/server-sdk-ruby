# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageVoiceRequest < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ServerMessageVoiceRequestPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ServerMessageVoiceRequestType }, optional: false, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :artifact, -> { Vapi::Types::Artifact }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :chat, -> { Vapi::Types::Chat }, optional: true, nullable: false
      field :text, -> { String }, optional: false, nullable: false
      field :sample_rate, -> { Integer }, optional: false, nullable: false, api_name: "sampleRate"
    end
  end
end
