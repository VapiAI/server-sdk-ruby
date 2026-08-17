# frozen_string_literal: true

module Vapi
  module Types
    # A phone-number hook action that speaks an exact message to the caller.
    class SayPhoneNumberHookAction < Internal::Types::Model
      field :exact, -> { String }, optional: false, nullable: false
    end
  end
end
