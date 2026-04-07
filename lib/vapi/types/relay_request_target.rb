# frozen_string_literal: true

module Vapi
  module Types
    # The target assistant or squad to relay the commands to
    class RelayRequestTarget < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::RelayTargetAssistant }, key: "ASSISTANT"
      member -> { Vapi::Types::RelayTargetSquad }, key: "SQUAD"
    end
  end
end
