# frozen_string_literal: true

module Vapi
  module Calls
    module Types
      class CreateCallsResponse < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        member -> { Vapi::Types::Call }
        member -> { Vapi::Types::CallBatchResponse }
      end
    end
  end
end
