# frozen_string_literal: true

module Vapi
  module Types
    class TestSuiteRun < Internal::Types::Model
      field :status, -> { Vapi::Types::TestSuiteRunStatus }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :test_suite_id, -> { String }, optional: false, nullable: false, api_name: "testSuiteId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :test_results, -> { Internal::Types::Array[Vapi::Types::TestSuiteRunTestResult] }, optional: false, nullable: false, api_name: "testResults"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
