# frozen_string_literal: true

module Vapi
  module Types
    class CreateTestSuiteTestVoiceDto < Internal::Types::Model
      field :scorers, -> { Internal::Types::Array[Vapi::Types::TestSuiteTestScorerAi] }, optional: false, nullable: false
      field :type, -> { Vapi::Types::CreateTestSuiteTestVoiceDtoType }, optional: false, nullable: false
      field :script, -> { String }, optional: false, nullable: false
      field :num_attempts, -> { Integer }, optional: true, nullable: false, api_name: "numAttempts"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
