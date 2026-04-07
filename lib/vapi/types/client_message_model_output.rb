# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessageModelOutput < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ClientMessageModelOutputPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ClientMessageModelOutputType }, optional: false, nullable: false
      field :turn_id, -> { String }, optional: true, nullable: false, api_name: "turnId"
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :output, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
