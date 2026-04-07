# frozen_string_literal: true

module Vapi
  module Types
    class PhoneNumberHookCallRinging < Internal::Types::Model
      field :filters, -> { Internal::Types::Array[Vapi::Types::PhoneNumberCallRingingHookFilter] }, optional: true, nullable: false
      field :do_, -> { Internal::Types::Array[Vapi::Types::PhoneNumberHookCallRingingDoItem] }, optional: false, nullable: false, api_name: "do"
    end
  end
end
