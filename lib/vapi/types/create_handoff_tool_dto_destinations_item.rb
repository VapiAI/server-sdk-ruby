# frozen_string_literal: true

module Vapi
  module Types
    class CreateHandoffToolDtoDestinationsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::HandoffDestinationAssistant }, key: "ASSISTANT"
      member -> { Vapi::Types::HandoffDestinationDynamic }, key: "DYNAMIC"
      member -> { Vapi::Types::HandoffDestinationSquad }, key: "SQUAD"
    end
  end
end
