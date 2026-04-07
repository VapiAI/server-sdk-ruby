# frozen_string_literal: true

module Vapi
  module PhoneNumbers
    module Types
      class UpdatePhoneNumbersRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :body, -> { Vapi::PhoneNumbers::Types::UpdatePhoneNumbersRequestBody }, optional: false, nullable: false
      end
    end
  end
end
