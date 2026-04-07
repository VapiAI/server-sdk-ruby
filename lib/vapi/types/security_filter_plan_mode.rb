# frozen_string_literal: true

module Vapi
  module Types
    module SecurityFilterPlanMode
      extend Vapi::Internal::Types::Enum

      SANITIZE = "sanitize"
      REJECT = "reject"
      REPLACE = "replace"
    end
  end
end
