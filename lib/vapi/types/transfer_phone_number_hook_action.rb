# frozen_string_literal: true

module Vapi
  module Types
    class TransferPhoneNumberHookAction < Internal::Types::Model
      field :destination, -> { Vapi::Types::TransferPhoneNumberHookActionDestination }, optional: true, nullable: false
    end
  end
end
