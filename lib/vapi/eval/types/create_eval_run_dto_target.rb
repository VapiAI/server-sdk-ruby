# frozen_string_literal: true

module Vapi
  module Eval
    module Types
      # This is the target that will be run against the eval
      class CreateEvalRunDtoTarget < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        discriminant :type

        member -> { Vapi::Types::EvalRunTargetAssistant }, key: "ASSISTANT"
        member -> { Vapi::Types::EvalRunTargetSquad }, key: "SQUAD"
      end
    end
  end
end
