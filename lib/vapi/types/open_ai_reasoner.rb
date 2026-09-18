# frozen_string_literal: true

module Vapi
  module Types
    class OpenAiReasoner < Internal::Types::Model
      field :provider, -> { Vapi::Types::OpenAiReasonerProvider }, optional: true, nullable: false
      field :model, -> { Vapi::Types::OpenAiReasonerModel }, optional: true, nullable: false
      field :reasoning_effort, -> { Vapi::Types::OpenAiReasonerReasoningEffort }, optional: true, nullable: false, api_name: "reasoningEffort"
      field :instructions, -> { String }, optional: true, nullable: false
    end
  end
end
