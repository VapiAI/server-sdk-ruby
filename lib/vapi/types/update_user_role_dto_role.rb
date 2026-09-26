# frozen_string_literal: true

module Vapi
  module Types
    class UpdateUserRoleDtoRole < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::UpdateUserRoleDtoRoleZero }
      member -> { String }
    end
  end
end
