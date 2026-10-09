# frozen_string_literal: true

module Vapi
  module Types
    module InviteUserDtoRoleZero
      extend Vapi::Internal::Types::Enum

      ADMIN = "admin"
      EDITOR = "editor"
      VIEWER = "viewer"
      HIPAA_SPECIAL = "hipaa-special"
    end
  end
end
