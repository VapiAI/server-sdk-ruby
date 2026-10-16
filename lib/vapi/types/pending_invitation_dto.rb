# frozen_string_literal: true

module Vapi
  module Types
    class PendingInvitationDto < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :email, -> { String }, optional: false, nullable: false
    end
  end
end
