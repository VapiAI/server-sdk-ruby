# frozen_string_literal: true

module Vapi
  module Types
    # Telephony transport cost for a call, including provider, billable minutes, and amount.
    class TransportCost < Internal::Types::Model
      field :provider, -> { Vapi::Types::TransportCostProvider }, optional: true, nullable: false
      field :minutes, -> { Integer }, optional: false, nullable: false
      field :cost, -> { Integer }, optional: false, nullable: false
    end
  end
end
