# frozen_string_literal: true

module Vapi
  module Types
    class TransferCancelToolUserEditable < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::TransferCancelToolUserEditableMessagesItem] }, optional: true, nullable: false
      field :type, -> { Vapi::Types::TransferCancelToolUserEditableType }, optional: false, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
