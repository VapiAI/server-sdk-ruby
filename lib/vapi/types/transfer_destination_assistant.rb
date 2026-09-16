# frozen_string_literal: true

module Vapi
  module Types
    # Transfers a call to another assistant by name, with an optional message and assistant-transfer mode.
    class TransferDestinationAssistant < Internal::Types::Model
      field :message, -> { Vapi::Types::TransferDestinationAssistantMessage }, optional: true, nullable: false
      field :type, -> { Vapi::Types::TransferDestinationAssistantType }, optional: false, nullable: false
      field :transfer_mode, -> { Vapi::Types::TransferMode }, optional: true, nullable: false, api_name: "transferMode"
      field :assistant_name, -> { String }, optional: false, nullable: false, api_name: "assistantName"
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
