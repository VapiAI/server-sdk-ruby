# frozen_string_literal: true

module Vapi
  module Types
    module SimulationOnboardingToolGapDtoReason
      extend Vapi::Internal::Types::Enum

      DYNAMIC_HANDOFF = "dynamic-handoff"
      DESTINATION_NOT_PLAIN = "destination-not-plain"
      DESTINATION_UNRESOLVED = "destination-unresolved"
      DESTINATION_TRUNCATED = "destination-truncated"
      TRANSFER_EXTERNAL = "transfer-external"
      DESTINATION_NAME_UNSCOPED = "destination-name-unscoped"
      NATIVE_TOOL_SHADOWED = "native-tool-shadowed"
    end
  end
end
