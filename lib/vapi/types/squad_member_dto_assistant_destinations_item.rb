# frozen_string_literal: true

module Vapi
  module Types
    class SquadMemberDtoAssistantDestinationsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::TransferDestinationAssistant }
      member -> { Vapi::Types::HandoffDestinationAssistant }
    end
  end
end
