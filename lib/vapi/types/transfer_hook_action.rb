# frozen_string_literal: true

module Vapi
  module Types
    class TransferHookAction < Internal::Types::Model
      field :type, -> { Vapi::Types::TransferHookActionType }, optional: false, nullable: false
      field :destination, -> { Vapi::Types::TransferHookActionDestination }, optional: true, nullable: false
    end
  end
end
