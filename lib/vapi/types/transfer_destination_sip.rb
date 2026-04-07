# frozen_string_literal: true

module Vapi
  module Types
    class TransferDestinationSip < Internal::Types::Model
      field :message, -> { Vapi::Types::TransferDestinationSipMessage }, optional: true, nullable: false
      field :sip_uri, -> { String }, optional: false, nullable: false, api_name: "sipUri"
      field :caller_id, -> { String }, optional: true, nullable: false, api_name: "callerId"
      field :transfer_plan, -> { Vapi::Types::TransferPlan }, optional: true, nullable: false, api_name: "transferPlan"
      field :sip_headers, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "sipHeaders"
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
