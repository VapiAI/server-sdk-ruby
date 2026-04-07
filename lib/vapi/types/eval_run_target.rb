# frozen_string_literal: true

module Vapi
  module Types
    # This is the target that will be run against the eval
    class EvalRunTarget < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::EvalRunTargetAssistant }, key: "ASSISTANT"
      member -> { Vapi::Types::EvalRunTargetSquad }, key: "SQUAD"
    end
  end
end
