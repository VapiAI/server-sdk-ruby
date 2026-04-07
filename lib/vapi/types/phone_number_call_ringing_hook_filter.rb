# frozen_string_literal: true

module Vapi
  module Types
    class PhoneNumberCallRingingHookFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::PhoneNumberCallRingingHookFilterType }, optional: false, nullable: false
      field :key, -> { Vapi::Types::PhoneNumberCallRingingHookFilterKey }, optional: false, nullable: false
      field :starts_with, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "startsWith"
    end
  end
end
