# frozen_string_literal: true

module Vapi
  module Types
    # Transfers a call to a phone number, with optional extension, caller ID, message, transfer plan, and number
    # validation.
    class TransferDestinationNumber < Internal::Types::Model
      field :message, -> { Vapi::Types::TransferDestinationNumberMessage }, optional: true, nullable: false
      field :number_e_164_check_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "numberE164CheckEnabled"
      field :number, -> { String }, optional: false, nullable: false
      field :extension, -> { String }, optional: true, nullable: false
      field :caller_id, -> { String }, optional: true, nullable: false, api_name: "callerId"
      field :transfer_plan, -> { Vapi::Types::TransferPlan }, optional: true, nullable: false, api_name: "transferPlan"
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
