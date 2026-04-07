# frozen_string_literal: true

module Vapi
  module PhoneNumbers
    module Types
      class DeletePhoneNumbersRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
