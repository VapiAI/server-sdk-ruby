# frozen_string_literal: true

module Vapi
  module Types
    class TestSuiteRunTestAttempt < Internal::Types::Model
      field :scorer_results, -> { Internal::Types::Array[Vapi::Types::TestSuiteRunScorerAi] }, optional: false, nullable: false, api_name: "scorerResults"
      field :call, -> { Vapi::Types::TestSuiteRunTestAttemptCall }, optional: true, nullable: false
      field :call_id, -> { String }, optional: true, nullable: false, api_name: "callId"
      field :metadata, -> { Vapi::Types::TestSuiteRunTestAttemptMetadata }, optional: true, nullable: false
    end
  end
end
