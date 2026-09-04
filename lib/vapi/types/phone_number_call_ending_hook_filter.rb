# frozen_string_literal: true

module Vapi
  module Types
    # Matches the call's ended reason against configured assistant-request failure reasons before an ending hook runs.
    class PhoneNumberCallEndingHookFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::PhoneNumberCallEndingHookFilterType }, optional: false, nullable: false
      field :key, -> { Vapi::Types::PhoneNumberCallEndingHookFilterKey }, optional: false, nullable: false
      field :one_of, -> { Internal::Types::Array[Vapi::Types::PhoneNumberCallEndingHookFilterOneOfItem] }, optional: false, nullable: false, api_name: "oneOf"
    end
  end
end
