# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessageAssistantSpeech < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ClientMessageAssistantSpeechPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ClientMessageAssistantSpeechType }, optional: false, nullable: false
      field :text, -> { String }, optional: false, nullable: false
      field :turn, -> { Integer }, optional: true, nullable: false
      field :source, -> { Vapi::Types::ClientMessageAssistantSpeechSource }, optional: true, nullable: false
      field :timing, -> { Vapi::Types::ClientMessageAssistantSpeechTiming }, optional: true, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
    end
  end
end
