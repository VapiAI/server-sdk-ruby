# frozen_string_literal: true

module Vapi
  module Types
    class RevokeInvitationResponseDto < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
