# frozen_string_literal: true

module Vapi
  module Types
    # Error returned for one customer entry in a batch call request.
    class CallBatchError < Internal::Types::Model
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: false, nullable: false
      field :error, -> { String }, optional: false, nullable: false
    end
  end
end
