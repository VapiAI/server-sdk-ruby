# frozen_string_literal: true

module Vapi
  module Types
    class UpdateTestSuiteTestVoiceDto < Internal::Types::Model
      field :scorers, -> { Internal::Types::Array[Vapi::Types::TestSuiteTestScorerAi] }, optional: true, nullable: false
      field :type, -> { Vapi::Types::UpdateTestSuiteTestVoiceDtoType }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :script, -> { String }, optional: true, nullable: false
      field :num_attempts, -> { Integer }, optional: true, nullable: false, api_name: "numAttempts"
    end
  end
end
