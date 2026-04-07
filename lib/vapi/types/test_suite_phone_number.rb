# frozen_string_literal: true

module Vapi
  module Types
    class TestSuitePhoneNumber < Internal::Types::Model
      field :provider, -> { Vapi::Types::TestSuitePhoneNumberProvider }, optional: false, nullable: false
      field :number, -> { String }, optional: false, nullable: false
    end
  end
end
