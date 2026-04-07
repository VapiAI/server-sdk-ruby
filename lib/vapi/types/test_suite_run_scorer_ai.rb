# frozen_string_literal: true

module Vapi
  module Types
    class TestSuiteRunScorerAi < Internal::Types::Model
      field :type, -> { Vapi::Types::TestSuiteRunScorerAiType }, optional: false, nullable: false
      field :result, -> { Vapi::Types::TestSuiteRunScorerAiResult }, optional: false, nullable: false
      field :reasoning, -> { String }, optional: false, nullable: false
      field :rubric, -> { String }, optional: false, nullable: false
    end
  end
end
