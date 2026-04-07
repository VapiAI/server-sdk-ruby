# frozen_string_literal: true

module Vapi
  module Types
    class EvalRunResult < Internal::Types::Model
      field :status, -> { Vapi::Types::EvalRunResultStatus }, optional: false, nullable: false
      field :messages, -> { Internal::Types::Array[Vapi::Types::EvalRunResultMessagesItem] }, optional: false, nullable: false
      field :started_at, -> { String }, optional: false, nullable: false, api_name: "startedAt"
      field :ended_at, -> { String }, optional: false, nullable: false, api_name: "endedAt"
    end
  end
end
