# frozen_string_literal: true

module Vapi
  module Types
    class TestSuiteRunTestResult < Internal::Types::Model
      field :test, -> { Vapi::Types::TestSuiteTestVoice }, optional: false, nullable: false
      field :attempts, -> { Internal::Types::Array[Vapi::Types::TestSuiteRunTestAttempt] }, optional: false, nullable: false
    end
  end
end
