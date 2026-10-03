# frozen_string_literal: true

module Vapi
  module Types
    # Runs configured transfer or message actions when a call ends with a matching assistant-request failure reason.
    class PhoneNumberHookCallEnding < Internal::Types::Model
      field :filters, -> { Internal::Types::Array[Vapi::Types::PhoneNumberCallEndingHookFilter] }, optional: true, nullable: false
      field :do_, -> { Vapi::Types::PhoneNumberHookCallEndingDo }, optional: true, nullable: false, api_name: "do"
    end
  end
end
