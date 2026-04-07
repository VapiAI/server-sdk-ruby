# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageEndOfCallReport < Internal::Types::Model
      field :phone_number, -> { Vapi::Types::ServerMessageEndOfCallReportPhoneNumber }, optional: true, nullable: false, api_name: "phoneNumber"
      field :type, -> { Vapi::Types::ServerMessageEndOfCallReportType }, optional: false, nullable: false
      field :ended_reason, -> { Vapi::Types::ServerMessageEndOfCallReportEndedReason }, optional: false, nullable: false, api_name: "endedReason"
      field :cost, -> { Integer }, optional: true, nullable: false
      field :costs, -> { Internal::Types::Array[Vapi::Types::ServerMessageEndOfCallReportCostsItem] }, optional: true, nullable: false
      field :destination, -> { Vapi::Types::ServerMessageEndOfCallReportDestination }, optional: true, nullable: false
      field :timestamp, -> { Integer }, optional: true, nullable: false
      field :artifact, -> { Vapi::Types::Artifact }, optional: false, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: true, nullable: false
      field :call, -> { Vapi::Types::Call }, optional: true, nullable: false
      field :chat, -> { Vapi::Types::Chat }, optional: true, nullable: false
      field :analysis, -> { Vapi::Types::Analysis }, optional: false, nullable: false
      field :started_at, -> { String }, optional: true, nullable: false, api_name: "startedAt"
      field :ended_at, -> { String }, optional: true, nullable: false, api_name: "endedAt"
      field :compliance, -> { Vapi::Types::Compliance }, optional: true, nullable: false
    end
  end
end
