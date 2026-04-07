# frozen_string_literal: true

module Vapi
  module Types
    class EvalRun < Internal::Types::Model
      field :status, -> { Vapi::Types::EvalRunStatus }, optional: false, nullable: false
      field :ended_reason, -> { Vapi::Types::EvalRunEndedReason }, optional: false, nullable: false, api_name: "endedReason"
      field :eval, -> { Vapi::Types::CreateEvalDto }, optional: true, nullable: false
      field :target, -> { Vapi::Types::EvalRunTarget }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :started_at, -> { String }, optional: false, nullable: false, api_name: "startedAt"
      field :ended_at, -> { String }, optional: false, nullable: false, api_name: "endedAt"
      field :ended_message, -> { String }, optional: true, nullable: false, api_name: "endedMessage"
      field :results, -> { Internal::Types::Array[Vapi::Types::EvalRunResult] }, optional: false, nullable: false
      field :cost, -> { Integer }, optional: false, nullable: false
      field :costs, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false
      field :type, -> { Vapi::Types::EvalRunType }, optional: false, nullable: false
      field :eval_id, -> { String }, optional: true, nullable: false, api_name: "evalId"
    end
  end
end
