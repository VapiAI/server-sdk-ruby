# frozen_string_literal: true

module Vapi
  module Types
    class PendingInvitationsResponseDto < Internal::Types::Model
      field :invitations, -> { Internal::Types::Array[Vapi::Types::PendingInvitationDto] }, optional: false, nullable: false
    end
  end
end
