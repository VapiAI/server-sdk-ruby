# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageTransferUpdate < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ServerMessageTransferUpdatePhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ServerMessageTransferUpdateType }, optional: false, nullable: false
      field :destination, -> { Vapi::Types::ServerMessageTransferUpdateDestination }, optional: true, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :artifact, -> { Vapi::Types::Artifact }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :chat, -> { Vapi::Types::Chat }, optional: true, nullable: false
      field :to_assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false, api_name: "toAssistant"
      field :from_assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false, api_name: "fromAssistant"
      field :to_step_record, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "toStepRecord"
      field :from_step_record, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "fromStepRecord"
    end
  end
end
