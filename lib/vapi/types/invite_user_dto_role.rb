# frozen_string_literal: true

module Vapi
  module Types
    class InviteUserDtoRole < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::InviteUserDtoRoleZero }
      member -> { String }
    end
  end
end
