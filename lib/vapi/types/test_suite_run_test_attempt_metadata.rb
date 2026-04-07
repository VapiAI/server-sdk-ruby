# frozen_string_literal: true

module Vapi
  module Types
    class TestSuiteRunTestAttemptMetadata < Internal::Types::Model
      field :session_id, -> { String }, optional: false, nullable: false, api_name: "sessionId"
    end
  end
end
