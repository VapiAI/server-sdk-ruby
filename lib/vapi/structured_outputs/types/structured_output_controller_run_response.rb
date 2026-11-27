# frozen_string_literal: true

module Vapi
  module StructuredOutputs
    module Types
      class StructuredOutputControllerRunResponse < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        member -> { Vapi::Types::StructuredOutputRerunResponse }
        member -> { Vapi::StructuredOutputs::Types::StructuredOutputControllerRunResponseOne }
      end
    end
  end
end
