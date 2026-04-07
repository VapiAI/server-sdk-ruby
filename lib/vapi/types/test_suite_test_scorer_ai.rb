# frozen_string_literal: true

module Vapi
  module Types
    class TestSuiteTestScorerAi < Internal::Types::Model
      field :type, -> { Vapi::Types::TestSuiteTestScorerAiType }, optional: false, nullable: false
      field :rubric, -> { String }, optional: false, nullable: false
    end
  end
end
