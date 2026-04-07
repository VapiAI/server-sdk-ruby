# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessageUserInterrupted < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ClientMessageUserInterruptedPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ClientMessageUserInterruptedType }, optional: false, nullable: false
      field :turn_id, -> { String }, optional: true, nullable: false, api_name: "turnId"
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
    end
  end
end
