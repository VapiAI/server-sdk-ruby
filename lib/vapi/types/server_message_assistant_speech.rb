# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageAssistantSpeech < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ServerMessageAssistantSpeechPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ServerMessageAssistantSpeechType }, optional: false, nullable: false
      field :text, -> { String }, optional: false, nullable: false
      field :turn, -> { Integer }, optional: true, nullable: false
      field :source, -> { Vapi::Types::ServerMessageAssistantSpeechSource }, optional: true, nullable: false
      field :timing, -> { Vapi::Types::ServerMessageAssistantSpeechTiming }, optional: true, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :artifact, -> { Vapi::Types::Artifact }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :chat, -> { Vapi::Types::Chat }, optional: true, nullable: false
    end
  end
end
