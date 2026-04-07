# frozen_string_literal: true

module Vapi
  module Types
    class TestSuiteRunTestAttemptCall < Internal::Types::Model
      field :artifact, -> { Vapi::Types::Artifact }, optional: false, nullable: false
    end
  end
end
