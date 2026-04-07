# frozen_string_literal: true

module Vapi
  module Types
    class TestSuiteTestChat < Internal::Types::Model
      field :scorers, -> { Internal::Types::Array[Vapi::Types::TestSuiteTestScorerAi] }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :test_suite_id, -> { String }, optional: false, nullable: false, api_name: "testSuiteId"
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
      field :script, -> { String }, optional: false, nullable: false
      field :num_attempts, -> { Integer }, optional: true, nullable: false, api_name: "numAttempts"
    end
  end
end
