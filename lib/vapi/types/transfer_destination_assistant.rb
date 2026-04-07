# frozen_string_literal: true

module Vapi
  module Types
    class TransferDestinationAssistant < Internal::Types::Model
      field :message, -> { Vapi::Types::TransferDestinationAssistantMessage }, optional: true, nullable: false
      field :type, -> { Vapi::Types::TransferDestinationAssistantType }, optional: false, nullable: false
      field :transfer_mode, -> { Vapi::Types::TransferMode }, optional: true, nullable: false, api_name: "transferMode"
      field :assistant_name, -> { String }, optional: false, nullable: false, api_name: "assistantName"
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
