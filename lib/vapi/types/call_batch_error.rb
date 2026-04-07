# frozen_string_literal: true

module Vapi
  module Types
    class CallBatchError < Internal::Types::Model
      field :customer, -> { Vapi::Types::CreateCustomerDto }, optional: false, nullable: false
      field :error, -> { String }, optional: false, nullable: false
    end
  end
end
