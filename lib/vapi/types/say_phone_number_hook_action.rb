# frozen_string_literal: true

module Vapi
  module Types
    class SayPhoneNumberHookAction < Internal::Types::Model
      field :exact, -> { String }, optional: false, nullable: false
    end
  end
end
