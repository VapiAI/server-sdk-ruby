# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageHang < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ServerMessageHangPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ServerMessageHangType }, optional: false, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :artifact, -> { Vapi::Types::Artifact }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :chat, -> { Vapi::Types::Chat }, optional: true, nullable: false
    end
  end
end
