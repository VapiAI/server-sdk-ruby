# frozen_string_literal: true

module Vapi
  module StructuredOutputs
    module Types
      class StructuredOutputControllerRunResponse < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        member -> { Vapi::StructuredOutputs::Types::StructuredOutputControllerRunResponseZero }
        member -> { Vapi::Types::StructuredOutputRerunResponse }
      end
    end
  end
end
