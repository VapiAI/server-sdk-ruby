# frozen_string_literal: true

module Vapi
  module Types
    class TestSuiteTestsPaginatedResponseResultsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TestSuiteTestVoice }, key: "VOICE"
      member -> { Vapi::Types::TestSuiteTestChat }, key: "CHAT"
    end
  end
end
